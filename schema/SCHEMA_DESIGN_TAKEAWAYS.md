# Scripture Burrito JSON Schema — Design Takeaways

This document summarizes recurring **design choices** in the `schema/` folder, based on review of the `*.schema.json` files. It is intended as guidance when drafting a new or evolved schema—not as normative specification text.

For product-level design rationale (flavorTypes, filenames, versioning policy), see also [Overall Design](../docs/schema_docs/design.rst) in the documentation.

---

## 1. JSON Schema baseline

- **Draft**: [JSON Schema Draft 07](http://json-schema.org/draft-07/schema) (`"$schema": "http://json-schema.org/draft-07/schema"` on every file).
- **Stable IDs**: Each file declares `"$id": "https://burrito.bible/schema/…"` so references resolve consistently in validators and editors.
- **Relative `$ref`**: Cross-file references use paths like `"$ref": "ingredient.schema.json"` or fragment refs into shared definitions: `"$ref": "common.schema.json#/definitions/languageTag"`.

---

## 2. One entity (or concern) per file

Roughly **51** `*.schema.json` files compose the full model. Typical split:

| Pattern | Examples |
|--------|----------|
| Singular type | `agency.schema.json`, `ingredient.schema.json`, `relationship.schema.json` |
| Plural wrapper | `agencies.schema.json` → array of `agency`; `ingredients.schema.json` → map of `ingredient` |
| Section of root metadata | `identification.schema.json`, `copyright.schema.json`, `languages.schema.json` |
| Variant-specific root | `source_metadata.schema.json`, `derived_metadata.schema.json`, `template_metadata.schema.json` |
| Meta block by category | `source_meta.schema.json`, `derived_meta.schema.json`, `template_meta.schema.json` |
| Shared primitives | `common.schema.json` (definitions only, not a document root) |

**Why this matters**

- **Reviewability**: PRs can touch one entity without re-diffing a monolith.
- **Documentation**: [sphinx-jsonschema](https://sphinx-jsonschema.readthedocs.io/) generates one RST page per schema; `gen_schema_docs.sh` mirrors the file layout.
- **Reuse**: The same `scope.schema.json` is referenced from burrito-level `currentScope`, per-ingredient `scope`, and elsewhere.

**Naming convention**

- **Files**: `snake_case.schema.json` (e.g. `audio_translation.schema.json`).
- **JSON properties**: `camelCase` (e.g. `flavorType`, `idAuthorities`, `dateCreated`).
- **Flavor names in data**: `camelCase` string constants (e.g. `"audioTranslation"`, `"textTranslation"`).

---

## 3. Directory layout mirrors domain

```
schema/
  common.schema.json          # shared definitions
  metadata.schema.json        # entry dispatcher
  type.schema.json            # flavorType / flavor discrimination
  scripture/                  # standard scripture flavors
  gloss/                      # gloss flavors
  parascriptural/             # parascriptural flavor details (e.g. word alignment)
  x_flavor.schema.json        # extension flavor shell
```

Subfolders group **flavor detail** schemas; top-level files hold **cross-cutting** metadata sections.

---

## 4. Root document: discriminate, then delegate

`metadata.schema.json` is a thin **router**: it inspects `meta.category` and `$ref`s to exactly one of three full roots:

- `source` → `source_metadata.schema.json`
- `derived` → `derived_metadata.schema.json`
- otherwise → `template_metadata.schema.json`

The three roots **share most top-level keys** (`format`, `meta`, `idAuthorities`, `identification`, `type`, `copyright`, `ingredients`, …) but differ in:

- **Required fields** (e.g. derived requires `recipe`; template has a lighter required set).
- **`meta` shape** (each category has its own `*_meta.schema.json` with a fixed `category` const).
- **Cross-cutting rules** (e.g. `source_metadata` and `template_metadata` pull in `copyright_constraints.schema.json` via `allOf`).

This pattern keeps **one validator entry point** while allowing **category-specific** strictness.

---

## 5. Closed objects by default (`additionalProperties: false`)

Most object schemas end with `"additionalProperties": false`. Unknown top-level or nested keys fail validation. That makes the interchange format **predictable for tools** and forces extensions to use explicit mechanisms (below).

Exceptions are intentional and narrow—for example `x_flavor.schema.json` sets `"additionalProperties": true` so vendor-specific flavor fields can live beside `name`.

---

## 6. Extension model: `x-` prefixes (not open-ended bags)

Extensions are **not** “any extra property anywhere.” They appear in controlled places:

### 6.1 Custom flavors (`x_flavor.schema.json`)

- Flavor `name` must match `^x-[a-z][a-zA-Z0-9]*$` (see also `common.schema.json` → `xToken`: `^x-[a-z][A-za-z0-9]*$`).
- `type.schema.json` routes standard scripture flavors to dedicated files; any other scripture flavor name matching `^x-` falls through to `x_flavor.schema.json`.
- Gloss / parascriptural / peripheral branches allow `oneOf` between a known flavor schema and `x_flavor.schema.json`.
- **`additionalProperties: true`** on `x_flavor` allows arbitrary flavor-detail fields once the name is recognized as custom.

Example: parascriptural word alignment uses `"name": "x-wordAlignment"` with alignment fields alongside it (see `docs/examples/artifacts/wordAlignment.json`).

### 6.2 Custom convention keys (`conventions` objects)

In several scripture flavor schemas, `conventions` is an object whose **values** are version strings (`^\d+\.\d+…`) and whose **keys** are restricted via `propertyNames`:

```json
"propertyNames": {
  "pattern": "^(x-)?[a-z][A-za-z0-9]*$",
  "oneOf": [
    { "$ref": "../common.schema.json#/definitions/xToken" },
    { "enum": ["usxRefs", "usxDirs", …] }
  ]
}
```

So each key is either a **registered** convention name or an **`x-` token**—not an arbitrary string.

### 6.3 Custom roles (`role.schema.json`)

Ingredient `role` is usually a closed `enum` or pattern (peripherals, story units, etc.). The last `oneOf` branch allows `"pattern": "^x-\\S.*\\S$"` for **x-roles**.

### 6.4 Custom relationship flavors (`relationship.schema.json`)

`flavor` is either a known enum value or matches `^x-[a-z][A-za-z0-9]*$`. A top-level `oneOf` documents that **x-flavors work with any `relationType`**, while standard flavors have tighter pairings with `relationType`.

### 6.5 Takeaway for new schema work

| Goal | Typical approach in this repo |
|------|------------------------------|
| Vendor-specific flavor | `x-myFlavor` + permissive flavor schema or dedicated file |
| Vendor-specific convention | `conventions["x-myConvention"] = "1.0"` |
| Vendor-specific role | `role: "x-myRole"` |
| Arbitrary metadata keys | **Avoid**; add a named property or `x-` convention instead |

---

## 7. Discriminated unions: nested `if` / `then` / `else`

Heavy use of **conditional subschemas** instead of a single giant `oneOf` at the root:

- **`type.schema.json`**: `flavorType.name` → scripture | gloss | parascriptural | peripheral; within scripture, nested chains select `text_translation`, `audio_translation`, … or `x_flavor`.
- **`metadata.schema.json`**: category dispatch as above.
- **Flavor internals**: e.g. `audio_translation.schema.json` uses `allOf` + `if`/`then` on array `contains` to enforce mutually exclusive performance flags (`singleVoice` vs `multipleVoice`, `reading` vs `drama`).

Tradeoff: validators and readers must follow the chain; the benefit is **compositional** refs and smaller per-flavor files.

---

## 8. Map-like objects: `additionalProperties` + `propertyNames`

Several sections are **objects used as dictionaries**:

| Section | Keys validated as | Values |
|---------|-------------------|--------|
| `ingredients` | `path` | `ingredient` |
| `idAuthorities` | `idAuthorityLabel` | authority record |
| `scope` | `bookId` (USFM 3-letter) | chapter/verse specifiers |
| `localizedNames` | (looser) | `localized_name` |
| `formats` (audio) | string | `format` definition |

`propertyNames` (often via `$ref` to `common.schema.json`) constrains keys; `additionalProperties` defines the value schema. This is preferable to parallel arrays of `{key, value}` pairs.

---

## 9. `common.schema.json` as the primitive layer

Centralizes reusable **definitions** (not a standalone document type):

- Identifiers: `bareId`, `prefixedId`, `revisionString`, `idAuthorityLabel`
- Locales: `languageTag`, `localizedText`, `localizedRichText`, `countryCode`, `rodCode`
- Media / paths: `url`, `path`, `mimeType`
- Scripture: `bookId` (large enum of USFM codes)
- Extension token: `xToken`
- Rich text: `simplifiedXhtml` with regex-based structural checks and honest `$comment` about limitations

Entity schemas stay focused on **structure and domain enums**; formatting rules live once in `common`.

---

## 10. Arrays vs objects for collections

- **Lists of records**: `languages`, `agencies`, `relationships`, `recipe` → `type: "array"` with `items: { "$ref": "…" }` and often `minItems: 1`.
- **Keyed collections**: `ingredients`, `scope`, `idAuthorities` → object maps as above.

Choose based on whether natural lookup is **by index** or **by stable key** (path, book id, authority label).

---

## 11. Flavor typing hierarchy

Conceptual layers (see `type.schema.json` and design docs):

1. **`flavorType.name`**: `scripture` | `gloss` | `parascriptural` | `peripheral`
2. **`flavor.name`**: specific flavor constant or `x-…`
3. **Flavor-specific fields**: in `schema/scripture/*`, `schema/gloss/*`, etc.

Scripture flavors typically require `currentScope` (`scope.schema.json`). Peripheral flavor typing may omit scope requirements in some branches.

Standard scripture flavors each include a **`name` const** matching the discriminator used in `type.schema.json` (e.g. `"const": "audioTranslation"`).

---

## 12. Documentation metadata in the schema itself

Authors treat the JSON Schema as **primary spec prose**:

- Every linkable section should have **`title`** and **`description`** (fed to Sphinx).
- Sections that need cross-links include **`$$target`** (project-specific; consumed by sphinx-jsonschema)—see README “Schema Documentation”.
- **`examples`** on properties (e.g. `language.tag`) improve generated docs.
- **`$comment`** for implementer notes that should not surface as user-facing description (e.g. regex limitations on XHTML, relationship x-flavor rules).

---

## 13. Validation and packaging

- **`schema/index.js`**: `require()`s every schema for Node/AJV tooling; exposes canonical `schemaIds` for `metadata` and `reference_format`.
- **Examples** under `docs/examples/artifacts/` are validated in CI (`code/validate.py`, `code/validate.js`).
- **`reference_format.schema.json`**: standalone ingredient-oriented schema (separate `$id`), not embedded in the main metadata tree—shows that not every schema is a metadata subsection.

---

## 14. Business rules encoded in the schema

Examples beyond `enum` and `required`:

- **Copyright** (`copyright.schema.json`): `oneOf` requiring `publicDomain`, or `shortStatements`, or `licenses`.
- **Copyright constraints** (`copyright_constraints.schema.json`): if not public domain, `agencies` must contain a `rightsHolder` (`if`/`then` at metadata level via `allOf`).
- **Checksum** (`ingredient.schema.json`): `md5` required; at most two algorithms (`maxProperties: 2`).
- **Category-dependent requirements**: `languages` required when `flavorType` is scripture or gloss (source/derived metadata).
- **Localized maps**: `minProperties: 1` on `localizedText` objects.

Prefer expressing invariants in schema when validators are the enforcement boundary.

---

## 15. Strict vs loose typing choices

| Area | Strictness |
|------|------------|
| Root metadata sections | Closed objects, explicit `required` |
| Known flavor details | Closed objects; rich `enum` / `const` |
| Custom flavors (`x_flavor`) | Open properties after `name` |
| `recipe[].data` | Generic `object` (operation-specific payload) |
| `formats` (audio) | Open keys (string), closed value shape per format |

The schema **tightens** where interoperability matters and **loosens** only at extension points or intentionally opaque payloads.

---

## 16. Practical checklist for a new schema effort

When aligning a new schema with these conventions:

1. **Draft-07**, stable `https://…` `$id`, relative `$ref`s.
2. **Split files** by entity; use `common.schema.json` (or a new shared definitions file) for reused primitives.
3. **Dispatch** at the root (category, flavor, etc.) with `if`/`then`/`else` or `oneOf`, then `$ref` leaf schemas.
4. Set **`additionalProperties: false`** everywhere except documented extension surfaces.
5. Use **`x-` prefixed names** for vendor extensions; register known names in `enum` / `propertyNames` where possible.
6. Use **`propertyNames`** for dictionary keys (paths, book ids, language tags).
7. Add **`title`**, **`description`**, optional **`examples`** and **`$$target`** for doc generation.
8. Register new files in **`schema/index.js`** and regenerate docs if applicable.
9. Provide **example JSON** and wire CI validation.

---

## 17. Related files (quick reference)

| File | Role |
|------|------|
| `metadata.schema.json` | Validator entry; routes by `meta.category` |
| `common.schema.json` | Shared definitions |
| `type.schema.json` | flavorType / flavor routing |
| `x_flavor.schema.json` | Extension flavor shell |
| `source_metadata.schema.json` | Default “full” burrito metadata |
| `index.js` | Bundles all schemas for tooling |

---

*Generated from review of `schema/**/*.schema.json` in the scripture-burrito repository.*

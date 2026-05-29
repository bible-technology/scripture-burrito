.. _derived_flavor:

##############################
Derived Burritos Specification
##############################

[:ref:`Tutorial <tutorial-derived>`]  [:ref:`Example <examples-textTranslation_derived>`]

A derived burrito is produced from one or more existing burritos rather than
created independently. Examples include back-translations produced from a source
translation, print-publication artifacts generated from an editing project, or
audio recordings aligned to a text translation.

================
Burrito Category
================

``meta.category``
    MUST be present. MUST be one of:

    * ``"source"`` — content created directly, intended to be edited
    * ``"derived"`` — content produced from one or more existing burritos
    * ``"template"`` — a reusable pattern for creating new burritos; MUST also
      include ``meta.templateName`` (a locale-map giving the template's name)

    A derived burrito MUST set ``meta.category`` to ``"derived"``. Consuming
    tools MAY use this field to decide whether to offer editing, to flag
    staleness when a source is updated, or to suppress the burrito from
    primary browsing views.

====================
Upstream Identifiers
====================

``identification.upstream``
    OPTIONAL. Records the external identifiers of burritos this burrito was
    derived from. Structure mirrors ``identification.primary``: keys are
    authority names declared in ``idAuthorities``; values are arrays of
    objects each containing a single entry mapping an id string to an object
    with ``revision`` and ``timestamp``.

    Use ``upstream`` when the source burritos are registered in an external
    authority such as the Digital Bible Library. If the source burritos are
    local and unregistered, use ``relationships`` instead.

Example::

    "idAuthorities": {
      "dbl": {
        "id": "https://thedigitalbiblelibrary.org",
        "name": {"en": "The Digital Bible Library"}
      }
    },
    "identification": {
      "name": {"en": "Zarma NT Back-Translation"},
      "upstream": {
        "dbl": [
          {
            "a3f9c12e887b4d01": {
              "revision": "1",
              "timestamp": "2025-11-04T09:00:00+01:00"
            }
          }
        ]
      }
    },

=============
Relationships
=============

``relationships``
    OPTIONAL array. Each entry MUST include:

    ``relationType`` (REQUIRED)
        MUST be one of:

        * ``"source"`` — the related burrito is a source from which this one
          was derived
        * ``"target"`` — the related burrito is a target of this burrito
        * ``"expression"`` — the related burrito is another expression of the
          same content (e.g. the same translation in a different serialisation)
        * ``"parascriptural"`` — the related burrito annotates or supplements
          the same Scripture passage
        * ``"peripheral"`` — the related burrito is a peripheral resource
          associated with this one

    ``flavor`` (REQUIRED)
        The flavor name of the related burrito. MUST be a standard flavor name
        (``"textTranslation"``, ``"audioTranslation"``, ``"alignment"``) or an
        ``x-`` prefixed custom flavor name.

    ``id`` (REQUIRED)
        A prefixed identifier string in the form ``authority::id`` (e.g.
        ``"dbl::a3f9c12e887b4d01"``). The authority MUST be declared in
        ``idAuthorities``.

    ``revision`` (OPTIONAL)
        A revision string identifying which version of the related burrito.

    ``variant`` (OPTIONAL)
        A named variant within the related burrito.

Example::

    "relationships": [
      {
        "relationType": "source",
        "flavor": "textTranslation",
        "id": "dbl::a3f9c12e887b4d01",
        "revision": "1"
      }
    ]

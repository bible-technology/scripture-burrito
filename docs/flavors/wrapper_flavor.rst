.. _wrapper_flavor:

########################################
Scripture Burrito Wrapper Specification
########################################


Wrapper
==========================

Overview
------------

A Scripture Burrito Wrapper provides a way to group multiple related
Scripture Burritos into a single project or distribution. Each contained
burrito remains an independent, self-contained Scripture Burrito with its
own metadata and flavor.

A wrapper does not define or alter the flavor of the contained burritos.
Instead, it identifies the burritos that belong together and describes
their relationship to the overall project.

A wrapper can contain different Scripture Burrito flavors, allowing
related resources such as audio translations, text translations, project
management data, intellectual property information, and other supported
flavors to be distributed together.

The wrapper is represented by a `wrapper.json` file located at the root
of the wrapper package. Each contained burrito MUST provide its own
``metadata.json``.

The following example shows a Scripture Burrito Wrapper containing four
related Scripture Burritos: a data burrito providing supplemental
project information, a text translation burrito containing derived
Bible text, an audio translation burrito representing the primary
source content, and an intellectual property burrito containing
supporting rights and licensing information:

.. admonition:: Full Scripture Burrito Wrapper
   :class: example

   .. code-block:: json

      {
        "meta": {
          "name": {
            "en": "Sample Burrito Burrito Wrapper"
          },
          "version": "2.0.0",
          "generator": {
            "name": "Audio Project Manager Train",
            "version": "4.6.0.alpha.0"
          },
          "dateCreated": "2026-08-13",
          "description": {
            "en": "A new burrito wrapper for Sample Burrito"
          },
          "abbreviation": {
            "en": "SEHSAM"
          },
          "defaultLocale": "en"
        },
        "format": "scripture burrito wrapper",
        "contents": {
          "burritos": [
            {
              "id": "SEHSAM-aPMData",
              "path": "data",
              "role": "supplemental"
            },
            {
              "id": "SEHSAM-text",
              "path": "text",
              "role": "derived"
            },
            {
              "id": "SEHSAM-audio",
              "path": "audio",
              "role": "source"
            },
            {
              "id": "SEHSAM-intellectualProperty",
              "path": "intellectualproperty",
              "role": "supplemental"
            }
          ]
        }
      }

This wrapper contains four Scripture Burritos, each located in a separate
directory within the wrapper package. The directory structure is as
follows::

    project/
    ├── wrapper.json
    ├── audio/
    │   └── metadata.json
    ├── text/
    │   └── metadata.json
    ├── apmdata/
    │   └── metadata.json
    └── intellectualproperty/
        └── metadata.json

Wrapper Structure
-----------------

A wrapper MUST contain the following top-level properties:

* `meta`
* `format`
* ``contents``

The following sections describe each property and its sub-properties.

Meta
------------

The ``meta`` property contains metadata describing the Scripture Burrito
Wrapper itself. It identifies the wrapper and provides information
about it as a whole. It does not apply to the individual Scripture
Burritos contained within the wrapper.


The ``meta`` object MUST contain the following properties:

* ``name``
* ``version``
* ``generator``
* ``dateCreated``

It MAY also contain:

* ``description``
* ``abbreviation``
* ``defaultLocale``


Name
~~~~~~~~~~~~~~~~~~~~~~~~

The ``name`` property contains one or more localized names for the
wrapper.

The property is an object in which each property name is a language or
locale code, and the corresponding property value is the human-readable
name of the wrapper in that language or locale.

For example::

    "name": {
      "en": "Sample Burrito Burrito Wrapper"
    }

A wrapper MAY provide names in multiple languages or locales::

    "name": {
      "en": "Sample Scripture Project",
      "fr": "Exemple de projet biblique"
    }

The language or locale codes SHOULD follow the conventions defined by
the Scripture Burrito specification.

Version
~~~~~~~~~~~~~~~~~~~~~~~~

The ``version`` property identifies the version of the wrapper.

The value MUST be a string. The version applies to the wrapper itself and
does not determine the version of any contained Scripture Burritos.

For example::

    "version": "2.0.0"

Generator
~~~~~~~~~~~~~

The ``generator`` property identifies the software or process that
created the wrapper.

The ``generator`` object MUST contain:

* ``name``
* ``version``

For example::

    "generator": {
      "name": "Audio Project Manager Train",
      "version": "4.6.0.alpha.0"
    }

The ``name`` property specifies the name of the software or process
that created the wrapper.

The ``version`` property specifies the version of the software used to
create the wrapper and MUST be represented as a string.

Date Created
~~~~~~~~~~~~~~~~

The ``dateCreated`` property identifies the date on which the wrapper
was created.

The value MUST be represented as a ISO 8601 date or datetime string (e.g. "2025-11-04T09:00:00+01:00").

Where:

* ``YYYY`` = four-digit year → ``2026``
* ``MM`` = two-digit month → ``08`` (August)
* ``DD`` = two-digit day → ``13``

For example::

    "dateCreated": "2026-08-13"

The ``dateCreated`` property applies to the wrapper itself and does not
necessarily represent the creation date of the contained burritos.

Description
~~~~~~~~~~~~~~~~~~

The optional ``description`` property provides descriptive text
about the wrapper.

The description MAY be provided in multiple languages or locales.

For example::

    "description": {
      "en": "A new burrito wrapper for Sample Burrito"
    }

Abbreviation
~~~~~~~~~~~~~~~~~~~~~~~~

The optional ``abbreviation`` property provides a short name or
abbreviation for the wrapper.

The abbreviation MAY be provided in multiple languages or locales.

.. admonition:: Abbreviation Example
   :class: example

   .. code-block:: json

      "abbreviation": {
        "en": "SEHSAM"
      }

Default Locale
~~~~~~~~~~~~~~~~~~

The ``defaultLocale`` property identifies the default language or locale
of the wrapper.

The value MUST be a valid BCP 47 language tag.

For example::

    "defaultLocale": "en"

The value ``en`` identifies the English language. More specific language
tags MAY be used where required, such as ``en-US`` for English as used
in the United States or ``en-GB`` for English as used in the United
Kingdom.


Contents
------------

The ``contents`` object MUST be included and MUST contain a
``burritos`` array.

Each entry identifies one Scripture Burrito contained within the wrapper.


.. admonition:: Contents Example
   :class: example

   .. code-block:: json

      "contents": {
        "burritos": [
          {
            "id": "ENGSEB2-audio",
            "path": "audio",
            "role": "source"
          },
          {
            "id": "ENGSEB2-text",
            "path": "text",
            "role": "derived"
          }
        ]
      }


The ``burritos`` array MUST contain at least one entry. Each entry MUST
contain:

* ``id``
* ``path``
* ``role``

The ``path`` is relative to the directory containing ``wrapper.json``.

Contained Burritos
-----------------------

Each entry in ``contents.burritos`` MUST identify a valid Scripture
Burrito.

The ``path`` is relative to the directory containing ``wrapper.json`` and
MUST identify the directory containing the burrito's ``metadata.json``.

Nested wrappers are NOT permitted and circular references MUST NOT occur.

The flavor of a contained burrito is determined by its own
``metadata.json``. The wrapper MUST NOT duplicate or override the flavor
information.


Burrito Roles
------------------

The ``role`` property describes the relationship of a contained burrito
to the other burritos in the wrapper.

The standard roles are:

+-------------------+-----------------------------------------------------------+
| Role              | Description                                               |
+===================+===========================================================+
| ``source``        | Primary or source content.                                |
+-------------------+-----------------------------------------------------------+
| ``derived``       | Content produced from another burrito.                    |
+-------------------+-----------------------------------------------------------+
| ``supplemental``  | Supporting material that is not itself the primary        |
|                   | Scripture deliverable.                                    |
+-------------------+-----------------------------------------------------------+

A wrapper MUST contain exactly one burrito with the role ``source``.
There can be multiple burritos with the roles ``derived`` or
``supplemental``.

Custom roles MAY be used where supported by the Scripture Burrito
specification. Custom roles SHOULD begin with ``x-``.

The role is a property of the relationship within the wrapper and does
not determine the flavor of the contained burrito.


Supporting Multiple Flavors
---------------------------------

A wrapper MAY contain any combination of supported Scripture Burrito
flavors.

For example, an audio Scripture project could contain:

* ``audioTranslation``
* ``textTranslation``
* ``intellectualProperty``
* ``apmData``

The wrapper therefore provides a mechanism for grouping related
Scripture Burritos without requiring the individual flavors to be
merged into a single burrito.

The flavor of each contained burrito is determined by its own
``metadata.json``. The example in the :ref:`Contents <contents>` section
contains multiple flavor burritos.

The first burrito in the ``contents.burritos`` array describes an audio
flavor burrito with the role ``source``. It is stored in the
audio/ directory, with its metadata in audio/metadata.json:

.. admonition:: Primary Burrito Example
   :class: example

   .. code-block:: json

      {
        "id": "SEHSAM-audio",
        "path": "audio",
        "role": "source"
      }


The following example describes a text flavor burrito with the
``derived`` role. It is related to the audio burrito described above,
with ``id`` set to ``SEHSAM-audio``. The text burrito is stored in the
``text/`` directory, with its metadata in ``text/metadata.json``:

.. admonition:: Derived Burrito Example
   :class: example

   .. code-block:: json

      {
        "id": "SEHSAM-text",
        "path": "text",
        "role": "derived"
      }

This separation allows each flavor to evolve independently while still
allowing related resources to be distributed together.

Wrapper and Contained Burrito Independence
------------------------------------------------

The wrapper and the contained Scripture Burritos have separate scopes.

The wrapper describes the collection of resources and the relationships
between them. It MUST NOT modify, override, or replace the metadata of a
contained burrito.

Each contained Scripture Burrito remains independently defined and
validated according to its own flavor specification.

For example, information describing an audio translation belongs in the
metadata of the audio Scripture Burrito, rather than being duplicated in
the wrapper.

The wrapper SHOULD contain only information that applies to the
collection as a whole or describes the relationship between the
contained resources.


Wrapper
--------------

A wrapper MUST NOT define or override the flavor of a contained
burrito. The flavor MUST be determined from the contained burrito's
``metadata.json``.

A wrapper MAY contain multiple burritos of the same flavor or burritos
of different flavors.

This allows the wrapper to group related resources while keeping each
Scripture Burrito independently defined and validated.


Validation
------------------

A Scripture Burrito Wrapper MUST be independently valid according to
this specification.

Validation of a wrapper MUST verify that:

* ``wrapper.json`` exists at the root of the wrapper package.
* The ``format`` property has the value ``scripture burrito wrapper``.
* The required ``meta`` properties are present.
* The ``contents`` object contains a ``burritos`` array.
* The ``burritos`` array contains at least one entry.
* Each burrito entry contains ``id``, ``path``, and ``role``.
* A contained Scripture Burrito contains its required ``metadata.json``.

Validation of each contained Scripture Burrito MUST be performed
according to the specification for that burrito's flavor.

The wrapper therefore provides a mechanism for validating the
relationship and structure of the collection, while the individual
burrito specifications remain responsible for validating the contents of
each burrito.


Additional Examples
-------------------------

Additional examples and sample Scripture Burrito audio translation
packages can be found in the ``sb_audioTranslation`` GitHub repository::

    https://github.com/bible-technology/sb_audioTranslation

########
Concepts
########

A **Burrito** is a collection of content plus metadata. That collection may be made available in various formats, such as a zip file, an Amazon S3 bucket
or a series of API calls. The term "burrito" describes the content, not the distribution mechanism.

Burritos contain *ingredients*. An ingredient is a file-like resource with a mimetype and, optionally, a canonical scope. Burritos typically contain several
types of ingredient.

Burritos exist in a number of **flavors**. A flavor describes a way to represent one class of entity as a burrito. Each flavor corresponds to a high-level
entity, such as a Scripture text project or a sign language dictionary. A flavor specification typically includes ingredients with multiple mimetypes.

Flavors are typically quite broadly defined. Additional constraints may be added using **conventions**. For example, an audio convention may specify that 
audio files represent whole chapters of Scripture, or that they are arranged according to a specific hierarchy. Burrito creators should respect any
convention they include in the metadata. Burrito consumers may use conventions to decide how or whether to process a burrito. The semantics of no specified
conventions is *caveat emptor*, ie nothing should be assumed about the content of the burrito beyond what is specified for the burrito flavor.

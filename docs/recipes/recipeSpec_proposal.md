# recipeSpecs

A proposal by Mark Howe

## Some requirements

* Handle all use cases, including the ones we haven't listed yet.

* Allow for generic recipeSpecs that can perform generic operations in spite of variable content, structure etc.

* Provide an effective sandbox (because we're asking other people to run or distribute these algorithms, blind).

## Components

* Optional overrides for source metadata both at the level of the recipe and the individual entry ("metadata" section)

* Optional setup of a global processing environment ("variables" section)

* Optional processing of individual ingredients ("processIngredients" section)

* Addition of source and/or processed ingredients to derived variant ("assembleContent" section)

* Creation of the recipe, ie the hierarchical running order of the content ("assembleRecipe" section)

A future version of the schema could restrict specific operators to specific components, which would enforce separation of concerns and also remove the possibility of, eg, adding an ingredient to a recipe and then deleting the ingredient.

## Data model

* Source is immutable, ie read only

* Derived variant is (more or less) write only, ie you put stuff there when it's done, somewhat like an XSLT result tree

* Workspace is where ingredients get modified if necessary. This acts as a kind of chroot, which seems useful given that, in practice, this will by implemented by write operations to a FS, DB, S3, etc.

## Language features

* Use JSON as the canonical representation, because JSON is apparently really easy to read, and also because we can validate that

* Dynamically scoped typed variables, which are more or less essential if recipe components are going to be reusable. (Without that, we have the JS "everything is global" problem, and, apart from security concerns, everything may break because different components use the same variable name for different things.)

* Strict types with no implicit coercion, which avoids a lot of edge cases, and which also allows for a lot more checking via schemas

* Collections which contain one data type, which avoids a lot more edge cases, and which is easy to work with in any modern language

* Fairly standard expression operators, with a typed signature (ie "length" returns a number and expects a string expression, an array expression or an object expression as its argument)

* Statements for variable assignment

* Statements to do stuff with ingredients

* Statements to do stuff with names

* Statements to build recipes in a DOM-like way

## UI scenarios

I assume that, for most users, recipeSpecs would be constructed via a graphical UI. For simple cases this could be a case of picking options and ticking boxes. For more complex scenarios the UI is going to need some sort of tree editor and some sort of "map content from source to derived via optional processing and name changes" functionality.

I also foresee a syntax for writing recipeSpecs that looks much more like a programming language - probably Lisp - that compiles into the JSON format. If the JSON format is canonical, everyone could come up with their own syntax to generate that if they wanted to.

## Processing scenarios

The proposal looks a lot like a parse tree, ie what programming languages tend to turn into before execution or compilation. Optionsfor processing this include

* Using the host language stack to tree walk through the JSON, preserving state along the way.

* Building an explicit stack in the host language to do that.

* Compiling the JSON into another language such as JS.

I intend to explore the third option, probably using XSLT 1.0 (which is much more standard across JS implementations than JS itself, and which should therefore be relatively portable across JS systems).

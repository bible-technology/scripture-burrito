module.exports = {
    schemaIds: {
	"metadata": "https://burrito.bible/schema/metadata.schema.json"
    },
    schemas: [
        require('./agencies.schema.json'),
        require('./agency.schema.json'),
        require('./common.schema.json'),
        require('./confidentiality.schema.json'),
        require('./copyright.schema.json'),
        require('./countries.schema.json'),
        require('./country.schema.json'),
        require('./identification.schema.json'),
        require('./idservers.schema.json'),
        require('./ingredient.schema.json'),
        require('./ingredients.schema.json'),
        require('./language.schema.json'),
        require('./languages.schema.json'),
        require('./meta.schema.json'),
        require('./metadata.schema.json'),
        require('./name.schema.json'),
        require('./names.schema.json'),
        require('./progress.schema.json'),
        require('./promotion.schema.json'),
        require('./relationships.schema.json'),
        require('./relationship.schema.json'),
        require('./type.schema.json'),
        require('./gloss/glossedTextStory.schema.json'),
        require('./parascriptural/parascripturalWordAlignment.schema.json'),
        require('./peripheral/peripheralVersification.schema.json'),
        require('./scripture/scriptureAudio.schema.json'),
        require('./scripture/scriptureBraille.schema.json'),
        require('./scripture/scripturePrint.schema.json'),
        require('./scripture/scriptureSignLanguageVideo.schema.json'),
        require('./scripture/scriptureText.schema.json')
    ]
};

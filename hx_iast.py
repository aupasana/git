import panflute as pf
from indic_transliteration import sanscript
from indic_transliteration.sanscript import transliterate

###
### Pandoc filter that takes all headers
### and transliterates them into IAST, and puts them in a subsequent 
### paragraph with class transliterated
###

# Function to transliterate the header text and add it as a new block with a class
def transliterate_header_text(elem, doc):
    if isinstance(elem, pf.Header):  # Check if the element is a header
        # Extract the text content of the header while preserving spaces
        header_text = ''
        for c in elem.content:
            if isinstance(c, pf.Str):  # If it's a text element, append its text
                header_text += c.text
            elif isinstance(c, pf.Space):  # If it's a space element, add a space
                header_text += ' '

        # Perform transliteration from Romanized text to Devanagari (you can change the target script)
        transliterated_text = f"( {transliterate(header_text, sanscript.DEVANAGARI, sanscript.IAST)} )"
        
        # Create a new paragraph with the transliterated text
        transliterated_paragraph = pf.Para(pf.Str(transliterated_text))
        
        # Create a Div with the class 'transliterated' to wrap the new paragraph
        transliterated_block = pf.Div(transliterated_paragraph, attributes={'class': 'transliterated'})
        
        # Return the original header and the new transliterated block
        return [elem, transliterated_block]
        
    return elem

# Main function to apply the filter
def main(doc=None):
    return pf.run_filter(transliterate_header_text, doc=doc)

# If running the script directly, call the main function
if __name__ == "__main__":
    main()

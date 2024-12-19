import panflute as pf
from indic_transliteration import sanscript
from indic_transliteration.sanscript import transliterate

# Function to transliterate the header text
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
        transliterated_text = transliterate(header_text, sanscript.DEVANAGARI, sanscript.IAST)
        
        # Rebuild the header content with the transliterated text
        elem.content = [pf.Str(transliterated_text)]
        
    return elem

# Main function to apply the filter
def main(doc=None):
    return pf.run_filter(transliterate_header_text, doc=doc)

# If running the script directly, call the main function
if __name__ == "__main__":
    main()

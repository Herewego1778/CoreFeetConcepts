"""
Description: This python script will transform html to pdf.
             It is configured to use script_documentation.html as input
             and convert it to script_documentation.pdf.
             The script must be located in the same folder as the HTML file.
Script Name: generate_pdf_from_html.py
"""
from xhtml2pdf import pisa

# --- Configuration (Review and Modify as needed) ---
input_html_file = "script_documentation.html"  # Default input HTML file
output_pdf_file = "script_documentation.pdf"        # Default output HTML file
# --- End Configuration ---

def convert_html_to_pdf(input_html, output_pdf):
    """Converts HTML to PDF using xhtml2pdf."""
    try:
        with open(input_html, "r", encoding="utf-8") as html_file:
            html_content = html_file.read()

        with open(output_pdf, "w+b") as pdf_file:
            pisa_status = pisa.CreatePDF(html_content, dest=pdf_file)

        if pisa_status.err:
            print(f"Error converting HTML to PDF: {pisa_status.err}")
            return False
        else:
            print(f"PDF file generated: {output_pdf}")
            return True
    except FileNotFoundError:
        print(f"Error: File '{input_html}' not found.")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

# Call the function to convert html to pdf using the values set in config.
convert_html_to_pdf(input_html_file, output_pdf_file)

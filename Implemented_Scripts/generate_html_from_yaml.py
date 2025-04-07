"""
Description: This Python script reads a YAML file (generated_script_documentation.yml), 
             transforms it into an HTML document (script_documentation.html), and saves it.
             To function correctly, the script must be copied to the directory containing 
             generated_script_documentation.yml.
Script Name: generate_html_from_yaml.py
"""

import yaml
from jinja2 import Template

# --- Configuration (Review and Modify as needed) ---
input_yaml_file = "generated_script_documentation.yml"  # Default input YAML file
output_html_file = "script_documentation.html"        # Default output HTML file
# --- End Configuration ---

# Read YAML
with open(input_yaml_file, "r") as file:
    data = yaml.safe_load(file)

# HTML Template
html_template = """
<!DOCTYPE html>
<html>
<head>
    <title>Script Documentation</title>
    <style>body {
  font-family: sans-serif;
  font-size: 12pt;
}

p { /* This CSS word-wrap property tells the browser (or PDF renderer) to break words if they are too long to fit on a line. 
       CSS white-space preserves whitespace (spaces, tabs, newlines) and also wraps lines when necessary. */
  word-wrap: break-word;
  max-width: 600px; /* Adjust this value as needed */
}

pre { /* For code blocks */
  white-space: pre-wrap;
  word-wrap: break-word;
}   </style>
</head>
<body>
    <h1>Script Documentation</h1>
    {% for item in data.Content %}
        <h2>{{ item.Title }}</h2>
        <p><strong>Description:</strong> {{ item.Description }}</p>
        <p><strong>Tutorial:</strong> {{ item.Tutorial }}</p>
        <pre><code>{{ item.Details }}</code></pre>
    {% endfor %}
</body>
</html>
"""

# Populate Template
template = Template(html_template)
html_output = template.render(data=data)

# Save HTML
with open(output_html_file, "w") as file:
    file.write(html_output)

print(f"HTML file generated: {output_html_file}")


# TutorialID: CoreFeetConcept-TEMPLATE-002
# This example is used in the `generate_html_from_yaml.py` script. Pass the variable html_template to the script.
# Here you can configure a new template. 
# HTML Template
html_template = """
<!DOCTYPE html>
<html>
<head>
    <title>Script Documentation</title>
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
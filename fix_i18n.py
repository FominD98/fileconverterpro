#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import re

with open('assets/js/translations.js', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix FAQ - replace question/answer with q/a and rename q1-q6
replacements = [
    # Change question: to q:
    (r"question: '", r"q: '"),
    (r'question: "', r'q: "'),
    # Change answer: to a:
    (r"answer: '", r"a: '"),
    (r'answer: "', r'a: "'),
    # Rename q1 to safe
    (r'\bq1:', 'safe:'),
    # Rename q2 to fileSize
    (r'\bq2:', 'fileSize:'),
    # Rename q3 to batch
    (r'\bq3:', 'batch:'),
    # Rename q4 to internet
    (r'\bq4:', 'internet:'),
    # Rename q5 to requirements
    (r'\bq5:', 'requirements:'),
    # Rename q6 to trial
    (r'\bq6:', 'trial:'),
]

for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content)

# Add footer.links structure - find all footer sections and add links
# Pattern: footer: {\n            features: 'xxx',\n            formats: 'xxx',\n            pricing: 'xxx',
footer_pattern = r"(footer: \{\s+)(features: '[^']+',\s+formats: '[^']+',\s+pricing: '[^']+')"

def add_footer_links(match):
    indent = match.group(1)
    original = match.group(2)

    # Extract the values
    features_match = re.search(r"features: '([^']+)'", original)
    formats_match = re.search(r"formats: '([^']+)'", original)
    pricing_match = re.search(r"pricing: '([^']+)'", original)

    if all([features_match, formats_match, pricing_match]):
        features = features_match.group(1)
        formats = formats_match.group(1)
        pricing = pricing_match.group(1)

        links_section = f"""links: {{
                store: 'Microsoft Store',
                features: '{features}',
                formats: '{formats}',
                pricing: '{pricing}'
            }},
            """
        return indent + links_section + original
    return match.group(0)

content = re.sub(footer_pattern, add_footer_links, content, flags=re.MULTILINE)

with open('assets/js/translations.js', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ Fixed translations structure!")
print("  - FAQ: question/answer → q/a")
print("  - FAQ: q1-q6 → safe/fileSize/batch/internet/requirements/trial")
print("  - Added footer.links wrapper")

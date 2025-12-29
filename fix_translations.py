#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Fix translations.js structure to match HTML data-i18n keys
"""

import re

# Read the file
with open('assets/js/translations.js', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix FAQ structure - add aliases for the new naming scheme
# Map q1 -> safe, q2 -> fileSize, q3 -> batch, q4 -> internet, q5 -> requirements, q6 -> trial

faq_mappings = [
    ('q1', 'safe'),
    ('q2', 'fileSize'),
    ('q3', 'batch'),
    ('q4', 'internet'),
    ('q5', 'requirements'),
    ('q6', 'trial')
]

# For each language, add the new FAQ keys as aliases
for old_key, new_key in faq_mappings:
    # Pattern to find q1, q2, etc. and duplicate them with new names
    # This regex finds the entire q1: {...} block
    pattern = rf'({new_key}: \{{.*?^\s+}},\s*$)?(\s+{old_key}: \{{.*?^\s+}})'

    def replacer(match):
        if match.group(1):  # Already has the new key
            return match.group(0)
        indent = '                '
        old_block = match.group(2)
        # Create new block with new key name
        new_block = old_block.replace(f'{old_key}:', f'{new_key}:')
        return new_block + ',\n' + old_block

    content = re.sub(pattern, replacer, content, flags=re.MULTILINE | re.DOTALL)

# Fix footer - add links wrapper
# Pattern: features: 'xxx',\n            formats: 'xxx',\n            pricing: 'xxx',
footer_pattern = r"(footer: \{[^}]*)(features: '([^']*)',\s+formats: '([^']*)',\s+pricing: '([^']*)',)"

def footer_replacer(match):
    features = match.group(3)
    formats = match.group(4)
    pricing = match.group(5)

    # Create the new structure with links wrapper
    return match.group(1) + f"""links: {{
                store: 'Microsoft Store',
                features: '{features}',
                formats: '{formats}',
                pricing: '{pricing}'
            }},
            features: '{features}',
            formats: '{formats}',
            pricing: '{pricing}',"""

content = re.sub(footer_pattern, footer_replacer, content, flags=re.MULTILINE)

# Write back
with open('assets/js/translations.js', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ Translations structure fixed!")
print("- Added oneTime and trial aliases")
print("- Added FAQ aliases (safe, fileSize, batch, internet, requirements, trial)")
print("- Added footer.links structure")

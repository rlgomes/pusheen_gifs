#!/usr/bin/env python

import os

from jinja2 import Template

template = Template('''
<html>
    <meta>
        <title>{% block title %}{% endblock %}</title>
    </meta>
    <body>
        <ul>
        {% for gif in gifs %}
          <li>
            <img src="{{ gif.path }}" alt=":{{ gif.name }}:" style="width:32px;height:32px;">
            <img src="{{ gif.original_path }}" alt=":{{ gif.name }}:" style="width:32px;height:32px;">
            <b>:{{ gif.name }}:</b>
          </li>
        {% endfor %}
        </ul>
    </body>
</html>
''')

gifs = []
for gif in os.listdir('slackables'):
    if gif.endswith('.gif'):
        gifs.append({
            'path': 'file:///' + os.path.abspath(os.path.join('slackables',gif)),
            'original_path': 'file:///' + os.path.abspath(os.path.join('gifs',gif)),
            'name': os.path.basename(gif)
        })

with open('preview.html', 'w') as output:
    output.write(template.render(gifs=gifs))

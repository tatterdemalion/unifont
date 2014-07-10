from bottle import route, run, template, request

fonts = {'caligraphy': 119964,
         'caligraphy_bold': 120016,
         'fraktur': 120068,
         'fraktur_bold': 120172}
default_font = fonts['caligraphy_bold']
html_escape = {10: '<br/>', 32: '&nbsp;'}


def find_chars(start, end, ascii_start):
    chars = {}
    for c, i in enumerate(range(start, end)):
        chars[chr(ascii_start + c)] = chr(i)
    return chars


def convert(text, font=default_font):
    math_start = fonts.get(font, default_font)
    capitals = find_chars(math_start, math_start + 26, 65)
    lowers = find_chars(math_start + 26, math_start + 52, 97)
    new_text = ''
    for letter in text:
        letter = capitals.get(letter, letter)
        letter = lowers.get(letter, letter)
        letter = html_escape.get(ord(letter), letter)
        new_text += letter
    return new_text


@route('/')
def index():
    return template('home_template')


@route('/convert/')
def convert_view():
    text = request.params.get('text')
    font = request.params.get('font')
    if text and len(text):
        return convert(text, font)
    return ''

run(host='localhost', port=8080)

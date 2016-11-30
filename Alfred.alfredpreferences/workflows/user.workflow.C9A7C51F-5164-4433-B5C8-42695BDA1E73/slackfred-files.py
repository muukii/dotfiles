import sys
import argparse
from workflow import Workflow, ICON_WEB, web, PasswordNotFound

def slackFiles(api_key):

    files = web.get('https://slack.com/api/files.list?token=' + api_key + '&count=50&pretty=1').json()
    filesList = files['files']

    return filesList

def searchSlackFiles(files):
    elements = []
    elements.append(files['name'])
    elements.append(files['title'])
    elements.append(files['filetype'])
    return u' '.join(elements)

def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs = '?', default = None)
    args = parser.parse_args(wf.args)

    try:
        api_key = wf.get_password('slack_api_key')
    except PasswordNotFound:
        wf.add_item('No API key set.'
            'Please run slt',
            valid = False)
        wf.send_feedback()
        return 0

    query = args.query

    def wrapper():
        return slackFiles(api_key)

    filesList = wf.cached_data('files', wrapper, max_age = 120)

    if query:
        filesList = wf.filter(query, filesList, key = searchSlackFiles)

    for files in filesList:
        if files['comments_count'] > 0:
            wf.add_item(title = files['name'],
                subtitle = files['initial_comment']['comment'],
                arg = files['url'],
                valid = True)
        else:
            wf.add_item(title = files['name'],
                arg = files['url'],
                valid = True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))
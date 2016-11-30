import sys
import argparse
from workflow import Workflow, ICON_WEB, web, PasswordNotFound

def slackList(api_key):
    slackChannels = web.get('https://slack.com/api/channels.list?token=' + api_key + '&pretty=1').json()
    slackUsers = web.get('https://slack.com/api/users.list?token=' + api_key + '&pretty=1').json()

    slackSearch = []
    for channels in slackChannels['channels']:
        slackSearch.append('#' + channels['name'])

    for users in slackUsers['members']:
        slackSearch.append('@' + users['name'])

    return slackSearch

def searchSlackNames(slackList):
    elements = []
    elements.append(slackList)
    return u' '.join(elements)

def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('--setkey', dest='apikey', nargs='?', default = None)
    parser.add_argument('query', nargs='?', default = None)
    args = parser.parse_args(wf.args)

    if args.apikey:
        wf.save_password('slack_api_key', args.apikey)
        return 0

    try:
        api_key = wf.get_password('slack_api_key')
    except PasswordNotFound:
        wf.add_item('No API key set.',
            'Please run slt',
            valid = False)
        wf.send_feedback()
        return 0

    if len(wf.args):
        query = wf.args[0]
    else:
        query = None

    def wrapper():
        return slackList(api_key)

    slackSearch = wf.cached_data('names', wrapper, max_age = 120)

    if query:
        slackSearch = wf.filter(query, slackSearch, key = searchSlackNames)

    for name in slackSearch:
        wf.add_item(title = name,
            arg = name,
            valid = True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))
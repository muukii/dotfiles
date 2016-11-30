import sys
import argparse
from workflow import Workflow, ICON_WEB, web, PasswordNotFound

def getChannelName(api_key, query):
    channelsList = web.get('https://slack.com/api/channels.list?token=' + api_key + '&pretty=1').json()

    for channels in channelsList['channels']:
        if channels['id'] == query:
            channelName = channels['name']
    return channelName

def slackChannels(api_key):

    channels = web.get('https://slack.com/api/channels.list?token=' + api_key + '&count=50&pretty=1').json()
    channelsList = channels['channels']

    return channelsList

def searchSlackChannels(channels):
    elements = []
    elements.append(channels['name'])
    return u' '.join(elements)

def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('--join', nargs = '?')
    parser.add_argument('--leave', dest = 'leave', nargs = '?')
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

    if args.leave:
        query = args.leave
        web.get('https://slack.com/api/channels.leave?token=' + api_key + '&channel=' + query + '&pretty=1')
    elif args.join:
        query = args.join
        channelName = getChannelName(api_key, query)
        web.get('https://slack.com/api/channels.join?token=' + api_key + '&name=' + channelName + '&pretty=1')

    def wrapper():
        return slackChannels(api_key)

    channelsList = wf.cached_data('channels', wrapper, max_age = 60)

    query = args.query

    if query:
        channelsList = wf.filter(query, channelsList, key = searchSlackChannels)

    for channels in channelsList:
        if channels['is_member'] == True:
            wf.add_item(title = channels['name'],
                subtitle = 'Member',
                arg = channels['id'],
                valid = True)
        elif channels['is_member'] == False:
            wf.add_item(title = channels['name'],
                subtitle = 'Not a member',
                arg = channels['id'],
                valid = True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))
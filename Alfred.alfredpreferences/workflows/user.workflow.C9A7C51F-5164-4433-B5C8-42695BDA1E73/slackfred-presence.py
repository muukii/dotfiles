import sys
import argparse
from workflow import Workflow, ICON_WEB, web, PasswordNotFound

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

    web.get('https://slack.com/api/presence.set?token=' + api_key + '&presence=' + query + '&pretty=1')

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))
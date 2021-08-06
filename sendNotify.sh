iniTime=${1}

if [[ -z "${iniTime}" ]];
  then elapsedTime="Couldn't measure"; 
  else elapsedTime="$(($(date +"%Y%m%d%H%M%S")-${iniTime})) seconds";
fi

TEXT='{
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": "Action name: *Tag-or-Commit-action*\n> _Repo_: <https://github.com/'${GITHUB_REPOSITORY}'|'${GITHUB_REPOSITORY}'>\n> _Workflow_: '${GITHUB_WORKFLOW}'\n> _Job_: <https://github.com/jeffbraga/github-actions-workshop/actions/runs/'${GITHUB_RUN_ID}'|'${GITHUB_JOB}'>\n> _Execution number_: '${GITHUB_RUN_NUMBER}'\n> _Elapsed Time_: '${elapsedTime}'\n> _Labels_: '${GITHUB_RUNNER_LABELS}'\n> _OS_: '${RUNNER_OS}'\n> _Hostname_: '${HOSTNAME}'\n> _Workspace_: '${GITHUB_WORKSPACE}'\n\n"
                }
            }
        ]
    }' 

DOMAIN='https://hooks.slack.com/services'
PATH='T02HHA0JJ/B02A7D3G3PF/pONi103b02HzfOLa4rbD1pRc'
echo "$TEXT"
echo "${DOMAIN}/${PATH}"
echo "SEC: ${SLACK_URL_WEBHOOK_DEV_TOOLS}"
echo "ANOTHER: ${ANOTHER}"
/usr/bin/curl -v -X POST -H 'Content-type: application/json' --data "${TEXT}" ${DOMAIN}/${PATH}


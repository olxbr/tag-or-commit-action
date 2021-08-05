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
                    "text": "Action name: *Tag-or-Commit-action*\n> Repo: '${GITHUB_REPOSITORY}'\n> Workflow: '${GITHUB_WORKFLOW}'\n> Job: '${GITHUB_JOB}'\n> Executions number: '${GITHUB_RUN_NUMBER}'\n> Elapsed Time: '${elapsedTime}'\n> Labels: '${GITHUB_RUNNER_LABELS}'\n> Hostname: '${HOSTNAME}'\n> Workspace: '${GITHUB_WORKSPACE}'"
                }
            }
        ]
    }' 

DOMAIN='https://hooks.slack.com/services'
PATH='T02HHA0JJ/B02A7D3G3PF/pONi103b02HzfOLa4rbD1pRc'
echo "$TEXT"
echo "${DOMAIN}/${PATH}"
/usr/bin/curl -v -X POST -H 'Content-type: application/json' --data "${TEXT}" ${DOMAIN}/${PATH}


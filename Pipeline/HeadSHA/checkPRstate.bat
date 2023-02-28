IF %GITHUB_PR_STATE%==OPEN (
git checkout %GITHUB_PR_HEAD_SHA%
)
IF %GITHUB_PR_STATE%==CLOSED IF %GITHUB_PR_COND_REF%==merge (
echo "PR is abandoned"
exit -1
)
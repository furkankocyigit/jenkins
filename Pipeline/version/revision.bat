:: NOTE: DO NOT CHANGE THIS BLOCK
FOR /F "tokens=* USEBACKQ" %%F IN (`git rev-parse --short HEAD`) DO (
SET BUILD_SCM_REVISION=%%F
)
IF NOT DEFINED GITHUB_PR_STATE (
SET BUILD_TYPE=MANUAL
goto skip
)
IF %GITHUB_PR_STATE%==OPEN (
SET BUILD_TYPE=REVIEW
) ELSE IF %GITHUB_PR_STATE%==CLOSED (
SET BUILD_TYPE=MERGE
) ELSE (
SET BUILD_TYPE=UNKNOWN
)
:skip
IF NOT DEFINED GIT_BRANCH (
SET GIT_BRANCH=${GITHUB_PR_TARGET_BRANCH}
)
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set "dt=%%a"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set BUILD_TIMESTAMP=%YYYY%%MM%%DD%%HH%%Min%
@echo BUILD_SCM_REVISION=%BUILD_SCM_REVISION%>>env.properties
@echo BUILD_TIMESTAMP=%BUILD_TIMESTAMP%>>env.properties
@echo BUILD_TYPE=%BUILD_TYPE%>>env.properties
@echo GIT_BRANCH=%GIT_BRANCH%>>env.properties

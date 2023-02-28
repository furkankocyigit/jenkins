# NOTE: COVERITY_PROJECT and VERSION environment variables must be set before.

echo "*-*-*-*-*-* REPORT BUILD STARTED -*-*-*-*-*-"
echo "env:VERSION =>"
echo ${env:VERSION}
echo "env.VERSION =>"
echo ${env.VERSION}
$env:Path += ";C:\Program Files\Coverity\Coverity Reports\bin"
cp C:\Coverity\coverity_report.yaml .
mkdir ..\..\coverity_reports

((Get-Content coverity_report.yaml -raw) -creplace '__PROJECT_VERSION__',${env:VERSION} ) | Set-Content coverity_report.yaml
((Get-Content coverity_report.yaml -raw) -creplace '__PROJECT_NAME__',${env:COVERITY_PROJECT}) | Set-Content coverity_report.yaml
$__ANALYSIS_DATE__ = Get-Date -Format "MM/dd/yyyy"
((Get-Content coverity_report.yaml -raw) -creplace '__ANALYSIS_DATE__',${__ANALYSIS_DATE__}) | Set-Content coverity_report.yaml

cov-generate-security-report coverity_report.yaml --auth-key-file C:\Coverity\jenkins_slave_auth_key.txt --company-logo C:\Coverity\MI_Logo_tagline_4C.png --project ${env:COVERITY_PROJECT} --output ..\..\coverity_reports\${env:COVERITY_PROJECT}_coverity_security_report_v${env:VERSION}.pdf

syn-generate-integrity-report coverity_report.yaml --auth-key-file C:\Coverity\jenkins_slave_auth_key.txt --company-logo C:\Coverity\MI_Logo_tagline_4C.png --project ${env:COVERITY_PROJECT} --output ..\..\coverity_reports\${env:COVERITY_PROJECT}_coverity_integrity_report_v${env:VERSION}.pdf

cov-generate-owasp-report coverity_report.yaml --auth-key-file C:\Coverity\jenkins_slave_auth_key.txt --company-logo C:\Coverity\MI_Logo_tagline_4C.png --project ${env:COVERITY_PROJECT} --output ..\..\coverity_reports\${env:COVERITY_PROJECT}_coverity_owasp_report_v${env:VERSION}.pdf

echo "*-*-*-*-*-* REPORT BUILD COMPLETED-*-*-*-*-*-"

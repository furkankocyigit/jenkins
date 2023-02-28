# NOTE: This block builds and scans the stream.
# Change STREAM_NAME variable. Add a copy of this block for every stream.
# Change MSBuild path and command arguments
# VERSION environment variable must be set before.

echo "*-*-*-*-*-*  SCAN STARTED -*-*-*-*-*-"
echo $env:WORKSPACE

$env:Path += ";c:\Program Files\Coverity\Coverity Static Analysis\bin"
$STREAM_NAME = "sp70_evkit_gui"

# https://www.nuget.org/downloads
dotnet restore ..\..\MAX25621EvKitGUI.sln


cov-configure --cs --xml-option=skip_file:".*MAX25621EvKitGUI.Tests.*"

cov-build --dir intDir_${STREAM_NAME} --emit-complementary-info dotnet publish -c Release -r win-x86 -p:PublishProfile=FolderProfile /m ..\..\MAX25621EvKitGUI.sln
if (!$?) {
	exit -1
}
cov-import-scm --dir intDir_${STREAM_NAME} --scm git
echo "===========cov-import-scm finished==========="
cov-analyze --dir intDir_${STREAM_NAME} --strip-path="$env:WORKSPACE" --all --aggressiveness-level high --security --concurrency --enable-constraint-fpp --enable-callgraph-metrics
echo "===========cov-analyze finished==========="
cov-commit-defects --dir intDir_${STREAM_NAME} --url https://coverity-mss.maxim-ic.com --auth-key-file  C:\Coverity\jenkins_slave_auth_key.txt --stream ${STREAM_NAME} --version v${env:VERSION} --description ${env:BUILD_TYPE} 
echo "===========cov-commit-defects finished==========="
C:\Coverity\coverity_compare_review_snapshot.exe -s ${STREAM_NAME} -o coverity_env_file.txt -e 0

echo "*-*-*-*-*-*  SCAN FINISHED -*-*-*-*-*-"

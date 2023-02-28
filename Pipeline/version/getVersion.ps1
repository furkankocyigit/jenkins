# NOTE: This block parses version.h file in source code for version info.
# Provide path to version.h file
echo "*-*-*-*-*-* GET VERSION STARTED *-*-*-*-*-"
$VERSION_MAJOR_LINE=Get-Content version.h | Select-String -Pattern VERSION_MAJOR
$VERSION_MAJOR=$VERSION_MAJOR_LINE.Line.Split(' ')[-1]
"VERSION_MAJOR=$VERSION_MAJOR" | Add-Content env.properties
$VERSION_MINOR_LINE=Get-Content version.h | Select-String -Pattern VERSION_MINOR
$VERSION_MINOR=$VERSION_MINOR_LINE.Line.Split(' ')[-1]
"VERSION_MINOR=$VERSION_MINOR" | Add-Content env.properties
if (${env:GITHUB_PR_STATE} -eq "OPEN"){
$VERSION= -join($VERSION_MAJOR, ".", $VERSION_MINOR, ".", ${env:BUILD_NUMBER})
} else {
$VERSION= -join($VERSION_MAJOR, ".", $VERSION_MINOR, ".", ${env:BUILD_NUMBER})
}
"VERSION=$VERSION" | Add-Content env.properties
echo "*-*-*-*-*-* GET VERSION FINISHED *-*-*-*-*-"
# NOTE: This block generates build info file to include from source code.
# Provide path to BuildInfo.cs file

echo "*-*-*-*-*-* BUILD INFO STARTED -*-*-*-*-*-"

@"
public static class BuildInfo
{
	public const string VersionMajorNumber = @"${env:VERSION_MAJOR}";
	public const string VersionMinorNumber = @"${env:VERSION_MINOR}";
	public const string VersionBuildNumber = @"${env:BUILD_NUMBER}";
	public const string Version = VersionMajorNumber + @"." + VersionMinorNumber + @"." + VersionBuildNumber;
	public const string BuildTimestamp = @"${env:BUILD_TIMESTAMP}";
	public const string BuildMachine = @"${env:NODE_NAME}";
  	public const string BuildType = @"${env:BUILD_TYPE}";
	public const string BuildSCMRevision = @"${env:BUILD_SCM_REVISION}";
}

"@ | Out-File -Encoding ASCII -filepath ../../MAX25621EvKitGUI/BuildInfo.cs
(Get-Content ../../MAX25621EvKitGUI/BuildInfo.cs -Raw).Replace("`n","`r`n") | Set-Content ../../MAX25621EvKitGUI/BuildInfo.cs -Force

echo "*-*-*-*-*-* BUILD INFO FINISHED -*-*-*-*-*-"

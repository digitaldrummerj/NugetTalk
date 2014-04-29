using Nuget.Config.Xdt.Tests;

abstract public class TestBase
{
	internal void InstallTest(Mother.TestFileNames fileNameToTestAgainst, Mother.ExpectedOutputFileNames fileNameWithExpectedOutput)
	{
		string expectedOutput = Mother.GetTestLog4NetconfigFileNameAndLocation(fileNameWithExpectedOutput, Mother.FileType.ExpectedConfigFiles);

		string fileToTransform = Mother.GetTestLog4NetconfigFileNameAndLocation(fileNameToTestAgainst, Mother.FileType.TestConfigFiles);

		Mother.TransformXmlFile(fileToTransform, Mother.InstallXdtFileLocation);
		Mother.CompareExpectXmlWithActual(expectedOutput);
	}

	internal void UninstallTest(Mother.TestFileNames fileNameToTestAgainst)
	{
		string fileToTransform = Mother.GetTestLog4NetconfigFileNameAndLocation(fileNameToTestAgainst, Mother.FileType.TestConfigFiles);

		Mother.TransformXmlFile(Mother.OutputFileName, Mother.UnInstallXdtFileLocation);
		Mother.CompareExpectXmlWithActual(fileToTransform);
	}
}
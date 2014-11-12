using System.IO;
using NUnit.Framework;

namespace Nuget.Config.Xdt.Tests
{
	[TestFixture]
	public class Log4NetXdtConfigTests : TestBase
	{
		[TearDown]
		public void TearDown()
		{
			if (File.Exists(Mother.OutputFileName))
			{
				File.Delete(Mother.OutputFileName);
			}
		}

		[Test]
		public void BlankConfigFileTest()
		{
			InstallTest(
				Mother.TestFileNames.BlankConfigFile,
				Mother.ExpectedOutputFileNames.JustConsoleAppender);

			UninstallTest(Mother.TestFileNames.BlankConfigFile);
		}

		[Test]
		public void AlreadyHasConfigSections()
		{
			InstallTest(
				Mother.TestFileNames.HasLog4NetConfigSection,
				Mother.ExpectedOutputFileNames.JustConsoleAppender);

			UninstallTest(Mother.TestFileNames.BlankConfigFile);
		}

		[Test]
		public void AlreadyHasConfigSectionWithOtherConfigs()
		{
			InstallTest(
				Mother.TestFileNames.HasConfigSectionWithoutLog4Net,
				Mother.ExpectedOutputFileNames.ConsoleAppenderWithOtherConfigSection);
			UninstallTest(Mother.TestFileNames.HasConfigSectionWithoutLog4Net);
		}

		[Test]
		public void AlreadyHasOtherAppendersTest()
		{
			InstallTest(Mother.TestFileNames.AlreadyHasOtherAppenders,
				Mother.ExpectedOutputFileNames.AlreadyHasOtherAppender);
			UninstallTest(Mother.TestFileNames.AlreadyHasOtherAppenders);
		}

		[Test]
		public void AlreadyHasOtherAppendersMissingConfigSectionTest()
		{
			InstallTest(Mother.TestFileNames.AlreadyHasOtherAppendersMissingConfigSection,
				Mother.ExpectedOutputFileNames.AlreadyHasOtherAppender);
			UninstallTest(Mother.TestFileNames.AlreadyHasOtherAppenders);
		}

		[Test]
		public void AlreadyHasOtherAppendersMissingLog4NetConfigSectionTest()
		{
			InstallTest(Mother.TestFileNames.AlreadyHasOtherAppendersMissingLog4NetConfigSection,
				Mother.ExpectedOutputFileNames.AlreadyHasOtherAppender);
			UninstallTest(Mother.TestFileNames.AlreadyHasOtherAppenders);
		}
	}
}
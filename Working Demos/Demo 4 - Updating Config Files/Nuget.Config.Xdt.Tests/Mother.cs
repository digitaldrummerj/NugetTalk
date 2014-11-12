namespace Nuget.Config.Xdt.Tests
{
	using System;
	using System.IO;
	using System.Xml;

	using Jolt.Testing.Assertions.NUnit;

	using Microsoft.Web.XmlTransform;

	using NUnit.Framework;

	/// <summary>
	/// Class to hold generic functions and objects that multiple test need.
	/// </summary>
	internal static class Mother
	{
		public static readonly string OutputFileName = Path.Combine(Helpers.GetAssemblyPath(), "log4net.config.output");

		private static readonly string TestConfigFileLocation = Path.Combine(Helpers.GetAssemblyPath(), "TestConfigFiles");

		internal static string InstallXdtFileLocation
		{
			get
			{
				return Path.Combine(TestConfigFileLocation, "log4net.config.install.xdt.sample");
			}
		}

		internal static string UnInstallXdtFileLocation
		{
			get
			{
				return Path.Combine(TestConfigFileLocation, "log4net.config.uninstall.xdt.sample");
			}
		}

		/// <summary>
		/// List of files that contain expected output.
		/// </summary>
		internal enum ExpectedOutputFileNames
		{
			JustConsoleAppender,

			ConsoleAppenderWithOtherConfigSection,

			AlreadyHasOtherAppender
		}

		/// <summary>
		/// List of starting files to transform
		/// </summary>
		internal enum TestFileNames
		{
			BlankConfigFile,

			HasLog4NetConfigSection,

			HasConfigSectionWithoutLog4Net,

			AlreadyHasOtherAppenders,

			AlreadyHasOtherAppendersMissingConfigSection,

			AlreadyHasOtherAppendersMissingLog4NetConfigSection
		}

		/// <summary>
		/// List of directories that contain TestFileNames or ExpectedOutputFileNames.
		/// </summary>
		internal enum FileType
		{
			ExpectedConfigFiles,

			TestConfigFiles
		}

		/// <summary>
		/// Loads the file.
		/// </summary>
		/// <param name="expectedOutputFile">The expected output file.</param>
		/// <param name="typeOfFile">The type of file.</param>
		/// <returns></returns>		
		internal static string GetTestLog4NetconfigFileNameAndLocation(Enum expectedOutputFile, FileType typeOfFile)
		{
			string path = Path.Combine(Helpers.GetAssemblyPath(), typeOfFile.ToString());
			string fileName = Path.Combine(path, expectedOutputFile + ".config");
			Assert.That(File.Exists(fileName), Is.True, "File {0} does not exist", fileName);

			return fileName;
		}

		internal static void CompareExpectXmlWithActual(string expectedOutput)
		{
			using (XmlReader expectedXml = Helpers.LoadXmlFile(expectedOutput),
				actualXml = Helpers.LoadXmlFile(OutputFileName))
			{
				XmlEquivalencyConstraint comparEquivalencyConstraint = new XmlEquivalencyConstraint(expectedXml).IgnoreSequenceOrder;
				Assert.That(comparEquivalencyConstraint.Matches(actualXml), Helpers.FormatExpectedErrorOutput(expectedOutput, OutputFileName));
			}
		}

		internal static void TransformXmlFile(string fileToTransform, string transformFile)
		{
			using (XmlTransformableDocument document = new XmlTransformableDocument())
			{
				document.PreserveWhitespace = true;
				document.Load(fileToTransform);

				using (XmlTransformation transform = new XmlTransformation(transformFile))
				{
					bool success = transform.Apply(document);
					Assert.That(success, Is.True, "Transform was not successful");
					document.Save(OutputFileName);
				}
			}
		}
	}
}
namespace Nuget.Config.Xdt.Tests
{
	using System;
	using System.IO;
	using System.Reflection;
	using System.Xml;

	/// <summary>
	/// Methods that are helper functions.
	/// </summary>
	internal static class Helpers
	{
		internal static string FormatExpectedErrorOutput(string expected, string actual)
		{
			return String.Format("*** Expected: ***{2}{0}{2}*** Actual: ***{2}{1}{2}", File.ReadAllText(expected), File.ReadAllText(actual), Environment.NewLine);
		}

		internal static XmlReader LoadXmlFile(string xmlFile)
		{
			return new XmlTextReader(xmlFile);
		}

		internal static string GetAssemblyPath()
		{
			string codeBase = Assembly.GetExecutingAssembly().CodeBase;
			UriBuilder uri = new UriBuilder(codeBase);
			string path = Uri.UnescapeDataString(uri.Path);
			return Path.GetDirectoryName(path);
		}
	}
}
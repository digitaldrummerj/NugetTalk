using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using log4net.Config;

namespace Log4NetNugetConsoleAppenderSample
{
	public static class LogManager
	{
		private static bool isInitialized;

		public static void Initialize()
		{
			Initialize(null);
		}

		private static void Initialize(string configFile)
		{
			if (!isInitialized)
			{
				if (!string.IsNullOrEmpty(configFile))
				{
					XmlConfigurator.ConfigureAndWatch(new FileInfo(configFile));
				}
				else
				{
					XmlConfigurator.Configure();
				}

				isInitialized = true;
			}
			else
			{
				throw new LoggingInitializationException("logging has already been initialized");
			}
		}


		public enum EntryType
		{
			All,
			Debug,
			Info,
			Warning,
			Error,
			Fatal,
		}

		public static ILogger GetLogger(Type type)
		{
			
			return new Log4NetWrapper(type);
		}
		
		
		public static ILogger GetLogger()
		{
			var stack = new StackTrace();
			var frame = stack.GetFrame(1);

			return new Log4NetWrapper(frame.GetMethod().DeclaringType);
		}

		public static string SerializeException(Exception exception)
		{
			return SerializeException(exception, String.Empty);
		}

		private static string SerializeException(Exception exception, string exceptionMessage)
		{
			if (exception == null)
			{
				return String.Empty;
			}

			exceptionMessage = String.Format(CultureInfo.InvariantCulture, "{0}{1}{2}\n{3}",
				exceptionMessage,
				String.IsNullOrEmpty(exceptionMessage) ? String.Empty : "\n\n",
				exception.Message,
				exception.StackTrace);

			if (exception.InnerException != null)
			{
				exceptionMessage = SerializeException(exception.InnerException, exceptionMessage);
			}

			return exceptionMessage;
		}
	}

	public class LoggingInitializationException : ApplicationException
	{
		public LoggingInitializationException(string message) : base(message)
		{
		}
	}
}
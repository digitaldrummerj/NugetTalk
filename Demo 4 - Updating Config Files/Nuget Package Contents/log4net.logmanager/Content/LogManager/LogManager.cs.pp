
namespace $rootnamespace$
{
	using System;
	using System.Diagnostics;
	using System.Globalization;
	using System.IO;
	using System.Runtime.CompilerServices;
	using log4net.Config;

	public static class LogManager
	{
		private static bool _isInitialized;
		public static readonly string EventLogSource = string.IsNullOrWhiteSpace($rootnamespace$.Properties.Settings.Default.ApplicationName) ? "Unknown Application" : $rootnamespace$.Properties.Settings.Default.ApplicationName;
		public const string EventLogName = "Application";

		public static void Initialize()
		{
			Initialize(null);
		}

		private static void Initialize(string configFile)
		{
			try
			{
				if (!_isInitialized)
				{
					if (!string.IsNullOrEmpty(configFile))
					{
						XmlConfigurator.ConfigureAndWatch(new FileInfo(configFile));
					}
					else
					{
						XmlConfigurator.Configure();
					}

					_isInitialized = true;
				}
				else
				{
					throw new LoggingInitializationException("logging has already been initialized");
				}
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
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
			try
			{
				return new Log4NetWrapper(type);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static ILogger GetLogger(string loggerName)
		{
			try
			{
				return new Log4NetWrapper(loggerName);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static string SerializeException(Exception exception)
		{
			try
			{
				return SerializeException(exception, String.Empty);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		private static string SerializeException(Exception exception, string exceptionMessage)
		{
			try
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
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static string ClassAndMethodName([CallerMemberName] string memberName = "",
			[CallerFilePath] string filePath = "",
			[CallerLineNumber] int lineNumber = 0)
		{
			try
			{
				return memberName;
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static string FormatLogMessage(string classAndMethodName, string message)
		{
			try
			{
				return string.Format("{0} - {1}", classAndMethodName, message);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static string FormatLogMessage(string classAndMethodName, string message, IFormatProvider provider, params object[] args)
		{
			try
			{
				return FormatLogMessage(classAndMethodName, string.Format(provider, message, args));
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static string FormatLogMessage(string classAndMethodName, string message, params object[] args)
		{
			try
			{
				return FormatLogMessage(classAndMethodName, string.Format(message, args));
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}

			return null;
		}

		public static void LogToEventLog(LogLevel logLevel, string message)
		{
			try
			{
				if (!EventLog.SourceExists(EventLogSource))
				{
					EventLog.CreateEventSource(EventLogSource, EventLogName);
				}

				var eventLogLoggingLevel = EventLogEntryType.Information;
				switch (logLevel)
				{
					case LogLevel.Debug:
					case LogLevel.Info:
						eventLogLoggingLevel = EventLogEntryType.Information;
						break;
					case LogLevel.Warning:
						eventLogLoggingLevel = EventLogEntryType.Warning;
						break;
					case LogLevel.Error:
					case LogLevel.Fatal:
					case LogLevel.All:
						eventLogLoggingLevel = EventLogEntryType.Error;
						break;
				}

				EventLog.WriteEntry(EventLogSource, message, eventLogLoggingLevel);
			}
			catch (Exception exception)
			{
				Console.WriteLine(exception);
				// Do nothing.  last resort.  logging shouldn't blow up the UI.
			}
		}
	}

	public class LoggingInitializationException : ApplicationException
	{
		public LoggingInitializationException(string message)
			: base(message)
		{
		}
	}
}
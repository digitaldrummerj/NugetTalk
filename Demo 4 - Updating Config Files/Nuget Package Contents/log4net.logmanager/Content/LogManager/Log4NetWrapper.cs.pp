using System;
using log4net;

namespace $rootnamespace$
{
	public class Log4NetWrapper : ILogger
	{
		private readonly ILog _logger;

		public Log4NetWrapper(Type type)
		{
			_logger = log4net.LogManager.GetLogger(type);
		}

		public Log4NetWrapper(string name)
		{
			_logger = log4net.LogManager.GetLogger(name);
		}

		#region Implementation of ILogger

		#region Debug

		public void Debug(object message)
		{
			try
			{
				_logger.Debug(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Debug, LogManager.SerializeException(e));
			}
		}

		public void Debug(object message, Exception exception)
		{
			try
			{
				_logger.Debug(message, exception);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Debug, LogManager.SerializeException(e));
			}
		}

		public void DebugFormat(string format, params object[] args)
		{
			try
			{
				var message = string.Format(format, args);
				Debug(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Debug, LogManager.SerializeException(e));
			}
		}

		public void DebugFormat(string format, object arg0)
		{
			try
			{
				DebugFormat(format, new[] {arg0});
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Debug, LogManager.SerializeException(e));
			}
		}

		public void DebugFormat(IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				var message = string.Format(provider, format, args);
				Debug(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Debug, LogManager.SerializeException(e));
			}
		}

		#endregion

		#region Info

		public void Info(object message)
		{
			try
			{
				_logger.Info(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Info, LogManager.SerializeException(e));
			}
		}

		public void Info(object message, Exception exception)
		{
			try
			{
				_logger.Info(message, exception);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Info, LogManager.SerializeException(e));
			}
		}

		public void InfoFormat(string format, params object[] args)
		{
			try
			{
				var message = string.Format(format, args);
				Info(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Info, LogManager.SerializeException(e));
			}
		}

		public void InfoFormat(string format, object arg0)
		{
			try
			{
				InfoFormat(format, new[] {arg0});
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Info, LogManager.SerializeException(e));
			}
		}

		public void InfoFormat(IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				var message = string.Format(provider, format, args);
				Info(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Info, LogManager.SerializeException(e));
			}
		}

		#endregion

		#region Warn

		public void Warn(object message)
		{
			try
			{
				_logger.Warn(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Warning, LogManager.SerializeException(e));
			}
		}

		public void Warn(object message, Exception exception)
		{
			try
			{
				_logger.Warn(message, exception);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Warning, LogManager.SerializeException(e));
			}
		}

		public void WarnFormat(string format, params object[] args)
		{
			try
			{
				var message = string.Format(format, args);
				Warn(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Warning, LogManager.SerializeException(e));
			}
		}

		public void WarnFormat(string format, object arg0)
		{
			try
			{
				WarnFormat(format, new[] {arg0});
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Warning, LogManager.SerializeException(e));
			}
		}

		public void WarnFormat(IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				var message = string.Format(provider, format, args);
				Warn(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Warning, LogManager.SerializeException(e));
			}
		}

		#endregion

		#region Error

		public void Error(object message)
		{
			try
			{
				_logger.Error(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Error, LogManager.SerializeException(e));
			}
		}

		public void Error(object message, Exception exception)
		{
			try
			{
				_logger.Error(message, exception);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Error, LogManager.SerializeException(e));
			}
		}

		public void ErrorFormat(string format, params object[] args)
		{
			try
			{
				var message = string.Format(format, args);
				Error(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Error, LogManager.SerializeException(e));
			}
		}

		public void ErrorFormat(string format, object arg0)
		{
			try
			{
				ErrorFormat(format, new[] {arg0});
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Error, LogManager.SerializeException(e));
			}
		}

		public void ErrorFormat(IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				var message = string.Format(provider, format, args);
				Error(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Error, LogManager.SerializeException(e));
			}
		}

		#endregion

		#region Fatal

		public void Fatal(object message)
		{
			try
			{
				_logger.Fatal(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Fatal, LogManager.SerializeException(e));
			}
		}

		public void Fatal(object message, Exception exception)
		{
			try
			{
				_logger.Fatal(message, exception);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Fatal, LogManager.SerializeException(e));
			}
		}

		public void FatalFormat(string format, params object[] args)
		{
			try
			{
				var message = string.Format(format, args);
				Fatal(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Fatal, LogManager.SerializeException(e));
			}
		}

		public void FatalFormat(string format, object arg0)
		{
			try
			{
				FatalFormat(format, new[] {arg0});
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Fatal, LogManager.SerializeException(e));
			}
		}

		public void FatalFormat(IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				var message = string.Format(provider, format, args);
				Fatal(message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(LogLevel.Fatal, LogManager.SerializeException(e));
			}
		}

		#endregion

		#endregion

		#region Properties

		public bool IsDebugEnabled
		{
			get { return _logger.IsDebugEnabled; }
		}

		public bool IsInfoEnabled
		{
			get { return _logger.IsInfoEnabled; }
		}

		public bool IsWarnEnabled
		{
			get { return _logger.IsWarnEnabled; }
		}

		public bool IsErrorEnabled
		{
			get { return _logger.IsErrorEnabled; }
		}

		public bool IsFatalEnabled
		{
			get { return _logger.IsFatalEnabled; }
		}

		#endregion
		
		public void LogMessage(LogLevel logLevel, string message)
		{
			try
			{
				LogMessage(logLevel, message, null);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(logLevel, LogManager.SerializeException(e));
			}
		}

		public void LogMessage(LogLevel logLevel, string message, Exception exception)
		{
			try
			{
				switch (logLevel)
				{
					case LogLevel.Debug:
						Debug(message, exception);
						break;
					case LogLevel.Info:
						Info(message, exception);
						break;
					case LogLevel.Warning:
						Warn(message, exception);
						break;
					case LogLevel.Error:
						Error(message, exception);
						break;
					case LogLevel.Fatal:
						Fatal(message, exception);
						break;
					case LogLevel.All:
						throw new ApplicationException("All is not a valid logging level.");
				}
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(logLevel, LogManager.SerializeException(e));
			}
		}

		public void LogMessageFormat(LogLevel logLevel, IFormatProvider provider, string format, params object[] args)
		{
			try
			{
				string message = string.Format(provider, format, args);
				LogMessage(logLevel, message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(logLevel, LogManager.SerializeException(e));
			}
		}

		public void LogMessageFormat(LogLevel logLevel, string format, params object[] args)
		{
			try
			{
				string message = string.Format(format, args);
				LogMessage(logLevel, message);
			}
			catch (Exception e)
			{
				LogManager.LogToEventLog(logLevel, LogManager.SerializeException(e));
			}
		}
	}
}
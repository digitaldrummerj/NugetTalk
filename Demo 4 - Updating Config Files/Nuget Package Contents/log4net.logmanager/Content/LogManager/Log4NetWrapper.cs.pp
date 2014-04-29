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
			_logger.Debug(message);
		}

		public void Debug(object message, Exception exception)
		{
			_logger.Debug(message, exception);
		}

		public void DebugFormat(string format, params object[] args)
		{
			var message = string.Format(format, args);
			Debug(message);
		}

		public void DebugFormat(string format, object arg0)
		{
			DebugFormat(format, new[] {arg0});
		}

		public void DebugFormat(IFormatProvider provider, string format, params object[] args)
		{
			var message = string.Format(provider, format, args);
			Debug(message);
		}

		#endregion

		#region Info

		public void Info(object message)
		{
			_logger.Info(message);
		}

		public void Info(object message, Exception exception)
		{
			_logger.Info(message, exception);
		}

		public void InfoFormat(string format, params object[] args)
		{
			var message = string.Format(format, args);
			Info(message);
		}

		public void InfoFormat(string format, object arg0)
		{
			InfoFormat(format, new[] {arg0});
		}

		public void InfoFormat(IFormatProvider provider, string format, params object[] args)
		{
			var message = string.Format(provider, format, args);
			Info(message);
		}

		#endregion

		#region Warn

		public void Warn(object message)
		{
			_logger.Warn(message);
		}

		public void Warn(object message, Exception exception)
		{
			_logger.Warn(message, exception);
		}

		public void WarnFormat(string format, params object[] args)
		{
			var message = string.Format(format, args);
			Warn(message);
		}

		public void WarnFormat(string format, object arg0)
		{
			WarnFormat(format, new[] {arg0});
		}

		public void WarnFormat(IFormatProvider provider, string format, params object[] args)
		{
			var message = string.Format(provider, format, args);
			Warn(message);
		}

		#endregion

		#region Error

		public void Error(object message)
		{
			_logger.Error(message);
		}

		public void Error(object message, Exception exception)
		{
			_logger.Error(message, exception);
		}

		public void ErrorFormat(string format, params object[] args)
		{
			var message = string.Format(format, args);
			Error(message);
		}

		public void ErrorFormat(string format, object arg0)
		{
			ErrorFormat(format, new[] {arg0});
		}

		public void ErrorFormat(IFormatProvider provider, string format, params object[] args)
		{
			var message = string.Format(provider, format, args);
			Error(message);
		}

		#endregion

		#region Fatal

		public void Fatal(object message)
		{
			_logger.Fatal(message);
		}

		public void Fatal(object message, Exception exception)
		{
			_logger.Fatal(message, exception);
		}

		public void FatalFormat(string format, params object[] args)
		{
			var message = string.Format(format, args);
			Fatal(message);
		}

		public void FatalFormat(string format, object arg0)
		{
			FatalFormat(format, new[] {arg0});
		}

		public void FatalFormat(IFormatProvider provider, string format, params object[] args)
		{
			var message = string.Format(provider, format, args);
			Fatal(message);
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
	}
}
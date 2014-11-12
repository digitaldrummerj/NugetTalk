using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Logging;
using Common.Logging.Simple;
namespace Demo_1
{
	class Program
	{
		static void Main(string[] args)
		{
			LogManager.Adapter = new ConsoleOutLoggerFactoryAdapter();
			ILog log = LogManager.GetCurrentClassLogger();
			log.Debug("some Debug Log Output");

			Console.WriteLine("Press Enter to Exit...");
			Console.ReadLine();
		}
	}
}
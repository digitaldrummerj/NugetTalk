using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NugetTalk.Demo2.Calculator.ConsoleUI
{
    class Program
    {
        static void Main(string[] args)
        {
			Console.WriteLine("Welcome to the Calculator Demo");
			Console.WriteLine("");

			StringBuilder previousProblems = new StringBuilder();
			while (true)
			{		   
				previousProblems.AppendLine(MainLogic.Run());

				Console.Clear();

				Console.WriteLine("Previous problems:");
				Console.WriteLine(previousProblems);
				Console.WriteLine("");
			}			
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace NugetTalk.Demo2.Calculator.ConsoleUI
{	public static class MainLogic
	{
		public static string Run()
		{			
			string results = string.Empty;

			FunctionHelper.Functions functionToRun = FunctionHelper.FunctionHelp();
			Console.Write("Please Enter 1st Number:");
			double firstNumber = GetNumber();

			Console.Write("Please Enter 2nd Number:");
			double secondNumber = GetNumber();

			double? answer = null;
			switch (functionToRun)
			{
				case FunctionHelper.Functions.Add:
					answer = Calculator.Add(firstNumber, secondNumber);
					break;
				case FunctionHelper.Functions.Substract:
					answer = Calculator.Subtract(firstNumber, secondNumber);
					break;
				case FunctionHelper.Functions.Multiply:
					answer = Calculator.Multiply(firstNumber, secondNumber);
					break;
				case FunctionHelper.Functions.Divide:
					answer = Calculator.Divide(firstNumber, secondNumber);
					break;
				default:
					Console.WriteLine("Unable to determine function to run. Press Enter to contine");
					Console.ReadLine();
					break;
			}

			if (answer.HasValue)
			{ 
				results = string.Format("Answer: {0}{1}{2} = {3}", firstNumber, FunctionHelper.GetSign(functionToRun), secondNumber, answer);
				Console.WriteLine(results);
				Console.WriteLine("");
				
				Console.WriteLine("press enter to continue.");
				Console.ReadLine();
			}

			return results;
		}

		public static double GetNumber()
		{
			bool successFirstNumber = false;
			double number = 0;
			do
			{
				
				string firstNumberEntered = Console.ReadLine();
				if (IsNumber(firstNumberEntered))
				{
					number = Double.Parse(firstNumberEntered);
					successFirstNumber = true;
				}
				else
				{
					Console.Write("Please try again: ");
				}
			} while (successFirstNumber == false);

			return number;
		}
		public static bool IsNumber(string value)
		{
			return IsNumericRegex.IsMatch(value);
		}

		static readonly Regex IsNumericRegex = new Regex("^(" +
			/*Hex*/ @"0x[0-9a-f]+" + "|" +
			/*Bin*/ @"0b[01]+" + "|" +
			/*Oct*/ @"0[0-7]+" + "|" +
			/*Dec*/ @"([-+])|(\d*\.)?\d+(e\d+)?" +
			")$");
	}
}

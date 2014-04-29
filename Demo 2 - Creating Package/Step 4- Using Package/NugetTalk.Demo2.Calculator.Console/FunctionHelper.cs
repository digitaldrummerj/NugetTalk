using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NugetTalk.Demo2.Calculator.ConsoleUI
{
	public class FunctionHelper
	{
		public enum Functions
		{
			Undefined = -1,
			Add = 1,
			Substract = 2,
			Multiply = 3,
			Divide = 4
		}

		public static string GetSign(Functions functionToRun)
		{
			switch (functionToRun)
			{
				case Functions.Add:
					return " + ";
				case Functions.Substract:
					return " - ";
				case Functions.Multiply:
					return " * ";
				case Functions.Divide:
					return " / ";
				default:
					return " UNDEFINED ";
			}
		}

		public static Functions FunctionHelp()
		{
			Console.WriteLine("Availe Functions:");
			Console.WriteLine("1. Add");
			Console.WriteLine("2. Subtract");
			Console.WriteLine("3. Multiply");
			Console.WriteLine("4. Divide");
			Console.WriteLine("");
			Console.WriteLine("0.  Exit Program");
			Console.WriteLine("");
			Console.Write("Please Enter Function to Run: ");
			
			bool validValueEntered = false;
			string enteredValue;
			Functions enumToUse;
			do
			{
				enteredValue = Console.ReadLine();
				validValueEntered = IsFunctionValid(enteredValue, out enumToUse);
				if (validValueEntered == false)
				{
					Console.WriteLine("");
					Console.WriteLine("Invalid Entry.  Please try again.");
					Console.Write("Please Enter Function to Run: ");
				}

			} while (validValueEntered == false);

			return enumToUse;

		}

		static bool IsFunctionValid(string enteredFunction, out Functions functionEnum)
		{
			int result;
			bool success = Int32.TryParse(enteredFunction, out result);
			if (success == false)
			{
				functionEnum = Functions.Undefined;
				return false;
			}

			if (result == 0)
			{
				Environment.Exit(0);
			}

			Functions enumResult;
			success = Enum.TryParse<Functions>(enteredFunction, out enumResult);
			functionEnum = enumResult;			
			if (enumResult == Functions.Undefined || success == false)
			{ 
				return false;
			}

			return true;
		}
	}
}

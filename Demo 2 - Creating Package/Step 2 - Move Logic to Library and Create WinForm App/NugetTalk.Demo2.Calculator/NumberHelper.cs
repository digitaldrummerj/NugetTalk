using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace NugetTalk.Demo2.Calculator
{
	public static class NumberHelper
	{
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

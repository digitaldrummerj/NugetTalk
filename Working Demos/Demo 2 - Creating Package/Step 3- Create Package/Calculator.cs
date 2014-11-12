using System;
using System.Collections.Generic;

using System.Text;


namespace NugetTalk.Demo2.Calculator
{
    public static class Calculator
    {
        public static double Add(double firstNumber, double secondNumber)
        {
            return firstNumber + secondNumber;
        }

        public static double Subtract(double firstNumber, double secondNumber)
        {
            return firstNumber - secondNumber;
        }

        public static double Multiply(double firstNumber, double secondNumber)
        {
            return firstNumber * secondNumber;
        }

        public static double Divide(double firstNumber, double secondNumber)
        {
            return firstNumber / secondNumber;
        }
    }
}

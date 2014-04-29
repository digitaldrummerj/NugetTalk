using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NugetTalk.Demo2.Calculator;

namespace WinFormUI
{
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		private void btnAnswer_Click(object sender, EventArgs e)
		{
			double firstNumber, secondNumber;
			bool isFirstNumberValid = GetNumber(txtFirstNumber, out firstNumber);
			bool isSecondNumberValid = GetNumber(txtSecondNumber, out secondNumber);
			string sign = "UNDEFINED";
			bool isFunctionSelected = IsFunctionSelected();
			if (isFirstNumberValid == false || isSecondNumberValid == false || isFunctionSelected == false)
			{
				return;
			}

			double answer = double.NaN;
			
			if (chkAdd.Checked)
			{
				sign = " + ";
				answer = Calculator.Add(firstNumber, secondNumber);
			}
			else if (chkSubtract.Checked)
			{
				sign = " - ";
				answer = Calculator.Subtract(firstNumber, secondNumber);
			}
			else if (chkMultiply.Checked)
			{
				sign = " * ";
				answer = Calculator.Multiply(firstNumber, secondNumber);
			}
			else if (chkDivide.Checked)
			{
				sign = " * ";
				answer = Calculator.Divide(firstNumber, secondNumber);
			}

			txtAnswers.Text += string.Format("{0} {1} {2} = {3}{4}", firstNumber, sign, secondNumber, answer, Environment.NewLine);
		}

		private bool IsFunctionSelected()
		{
			if (chkAdd.Checked || chkSubtract.Checked || chkMultiply.Checked || chkDivide.Checked)
			{
				chkAdd.BackColor = SystemColors.Control;
				chkSubtract.BackColor = SystemColors.Control;
				chkMultiply.BackColor = SystemColors.Control;
				chkDivide.BackColor = SystemColors.Control;
				return true;
			}

			chkAdd.BackColor = Color.Red;
			chkSubtract.BackColor = Color.Red;
			chkMultiply.BackColor = Color.Red;
			chkDivide.BackColor = Color.Red;
			return false;
		}

		private bool GetNumber(TextBox control, out double number)
		{
			string valueEntered = control.Text;
			if (string.IsNullOrEmpty(valueEntered))
			{
				control.BackColor = Color.Red;
				number = double.NaN;
				return false;
			}


			bool isNumber = NumberHelper.IsNumber(valueEntered);
			double numberParsed;
			if (isNumber)
			{
				bool result = Double.TryParse(valueEntered, out numberParsed);
				number = numberParsed;
				if (result)
				{
					control.BackColor = SystemColors.Window;					
					return true;
				}
				
				return false;
			}
			else
			{
				control.BackColor = Color.Red;
				number = double.NaN;
				return false;
			}			
		}

		
		private void btnClearAnswers_Click(object sender, EventArgs e)
		{
			txtAnswers.Clear();
		}	
		private void chkAdd_MouseUp(object sender, MouseEventArgs e)
		{
			chkSubtract.Checked = false;
			chkMultiply.Checked = false;
			chkDivide.Checked = false;

			chkSubtract.BackColor = SystemColors.Control;
			chkMultiply.BackColor = SystemColors.Control;
			chkDivide.BackColor = SystemColors.Control;
		}

		private void chkSubtract_MouseUp(object sender, MouseEventArgs e)
		{
			chkAdd.Checked = false;
			chkMultiply.Checked = false;
			chkDivide.Checked = false;
			chkAdd.BackColor = SystemColors.Control;
			chkMultiply.BackColor = SystemColors.Control;
			chkDivide.BackColor = SystemColors.Control;
				
		}

		private void chkMultiply_MouseUp(object sender, MouseEventArgs e)
		{
			chkSubtract.Checked = false;
			chkAdd.Checked = false;
			chkDivide.Checked = false;
			chkAdd.BackColor = SystemColors.Control;
			chkSubtract.BackColor = SystemColors.Control;
			chkDivide.BackColor = SystemColors.Control;
		}

		private void chkDivide_MouseUp(object sender, MouseEventArgs e)
		{
			chkSubtract.Checked = false;
			chkMultiply.Checked = false;
			chkAdd.Checked = false;
			chkAdd.BackColor = SystemColors.Control;
			chkSubtract.BackColor = SystemColors.Control;
			chkMultiply.BackColor = SystemColors.Control;
			
		}


	}
}

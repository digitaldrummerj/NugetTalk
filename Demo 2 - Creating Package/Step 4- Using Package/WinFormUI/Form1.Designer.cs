namespace WinFormUI
{
	partial class Form1
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.lblFirstNumber = new System.Windows.Forms.Label();
			this.txtFirstNumber = new System.Windows.Forms.TextBox();
			this.lblSecondNumber = new System.Windows.Forms.Label();
			this.txtSecondNumber = new System.Windows.Forms.TextBox();
			this.chkAdd = new System.Windows.Forms.CheckBox();
			this.chkDivide = new System.Windows.Forms.CheckBox();
			this.chkMultiply = new System.Windows.Forms.CheckBox();
			this.chkSubtract = new System.Windows.Forms.CheckBox();
			this.btnAnswer = new System.Windows.Forms.Button();
			this.btnClearAnswers = new System.Windows.Forms.Button();
			this.txtAnswers = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// lblFirstNumber
			// 
			this.lblFirstNumber.AutoSize = true;
			this.lblFirstNumber.Location = new System.Drawing.Point(8, 14);
			this.lblFirstNumber.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
			this.lblFirstNumber.Name = "lblFirstNumber";
			this.lblFirstNumber.Size = new System.Drawing.Size(124, 24);
			this.lblFirstNumber.TabIndex = 0;
			this.lblFirstNumber.Text = "First Number:";
			// 
			// txtFirstNumber
			// 
			this.txtFirstNumber.Location = new System.Drawing.Point(184, 9);
			this.txtFirstNumber.Margin = new System.Windows.Forms.Padding(6);
			this.txtFirstNumber.Name = "txtFirstNumber";
			this.txtFirstNumber.Size = new System.Drawing.Size(180, 29);
			this.txtFirstNumber.TabIndex = 1;
			// 
			// lblSecondNumber
			// 
			this.lblSecondNumber.AutoSize = true;
			this.lblSecondNumber.Location = new System.Drawing.Point(8, 75);
			this.lblSecondNumber.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
			this.lblSecondNumber.Name = "lblSecondNumber";
			this.lblSecondNumber.Size = new System.Drawing.Size(155, 24);
			this.lblSecondNumber.TabIndex = 2;
			this.lblSecondNumber.Text = "Second Number:";
			// 
			// txtSecondNumber
			// 
			this.txtSecondNumber.Location = new System.Drawing.Point(184, 70);
			this.txtSecondNumber.Margin = new System.Windows.Forms.Padding(6);
			this.txtSecondNumber.Name = "txtSecondNumber";
			this.txtSecondNumber.Size = new System.Drawing.Size(180, 29);
			this.txtSecondNumber.TabIndex = 3;
			// 
			// chkAdd
			// 
			this.chkAdd.Appearance = System.Windows.Forms.Appearance.Button;
			this.chkAdd.AutoSize = true;
			this.chkAdd.Location = new System.Drawing.Point(394, 4);
			this.chkAdd.Margin = new System.Windows.Forms.Padding(6);
			this.chkAdd.Name = "chkAdd";
			this.chkAdd.Size = new System.Drawing.Size(31, 34);
			this.chkAdd.TabIndex = 7;
			this.chkAdd.Text = "+";
			this.chkAdd.UseVisualStyleBackColor = true;
			this.chkAdd.MouseUp += new System.Windows.Forms.MouseEventHandler(this.chkAdd_MouseUp);
			// 
			// chkDivide
			// 
			this.chkDivide.Appearance = System.Windows.Forms.Appearance.Button;
			this.chkDivide.AutoSize = true;
			this.chkDivide.Location = new System.Drawing.Point(545, 4);
			this.chkDivide.Margin = new System.Windows.Forms.Padding(6);
			this.chkDivide.Name = "chkDivide";
			this.chkDivide.Size = new System.Drawing.Size(25, 34);
			this.chkDivide.TabIndex = 8;
			this.chkDivide.Text = "/";
			this.chkDivide.UseVisualStyleBackColor = true;
			this.chkDivide.MouseUp += new System.Windows.Forms.MouseEventHandler(this.chkDivide_MouseUp);
			// 
			// chkMultiply
			// 
			this.chkMultiply.Appearance = System.Windows.Forms.Appearance.Button;
			this.chkMultiply.AutoSize = true;
			this.chkMultiply.Location = new System.Drawing.Point(495, 4);
			this.chkMultiply.Margin = new System.Windows.Forms.Padding(6);
			this.chkMultiply.Name = "chkMultiply";
			this.chkMultiply.Size = new System.Drawing.Size(27, 34);
			this.chkMultiply.TabIndex = 9;
			this.chkMultiply.Text = "*";
			this.chkMultiply.UseVisualStyleBackColor = true;
			this.chkMultiply.MouseUp += new System.Windows.Forms.MouseEventHandler(this.chkMultiply_MouseUp);
			// 
			// chkSubtract
			// 
			this.chkSubtract.Appearance = System.Windows.Forms.Appearance.Button;
			this.chkSubtract.AutoSize = true;
			this.chkSubtract.Location = new System.Drawing.Point(444, 4);
			this.chkSubtract.Margin = new System.Windows.Forms.Padding(6);
			this.chkSubtract.Name = "chkSubtract";
			this.chkSubtract.Size = new System.Drawing.Size(26, 34);
			this.chkSubtract.TabIndex = 10;
			this.chkSubtract.Text = "-";
			this.chkSubtract.UseVisualStyleBackColor = true;
			this.chkSubtract.MouseUp += new System.Windows.Forms.MouseEventHandler(this.chkSubtract_MouseUp);
			// 
			// btnAnswer
			// 
			this.btnAnswer.Location = new System.Drawing.Point(390, 45);
			this.btnAnswer.Margin = new System.Windows.Forms.Padding(6);
			this.btnAnswer.Name = "btnAnswer";
			this.btnAnswer.Size = new System.Drawing.Size(180, 54);
			this.btnAnswer.TabIndex = 11;
			this.btnAnswer.Text = "=";
			this.btnAnswer.UseVisualStyleBackColor = true;
			this.btnAnswer.Click += new System.EventHandler(this.btnAnswer_Click);
			// 
			// btnClearAnswers
			// 
			this.btnClearAnswers.Location = new System.Drawing.Point(347, 345);
			this.btnClearAnswers.Name = "btnClearAnswers";
			this.btnClearAnswers.Size = new System.Drawing.Size(223, 36);
			this.btnClearAnswers.TabIndex = 13;
			this.btnClearAnswers.Text = "Clear Answers";
			this.btnClearAnswers.UseVisualStyleBackColor = true;
			this.btnClearAnswers.Click += new System.EventHandler(this.btnClearAnswers_Click);
			// 
			// txtAnswers
			// 
			this.txtAnswers.Location = new System.Drawing.Point(12, 108);
			this.txtAnswers.Multiline = true;
			this.txtAnswers.Name = "txtAnswers";
			this.txtAnswers.Size = new System.Drawing.Size(558, 231);
			this.txtAnswers.TabIndex = 14;
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 24F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(582, 393);
			this.Controls.Add(this.txtAnswers);
			this.Controls.Add(this.btnClearAnswers);
			this.Controls.Add(this.btnAnswer);
			this.Controls.Add(this.chkSubtract);
			this.Controls.Add(this.chkMultiply);
			this.Controls.Add(this.chkDivide);
			this.Controls.Add(this.chkAdd);
			this.Controls.Add(this.txtSecondNumber);
			this.Controls.Add(this.lblSecondNumber);
			this.Controls.Add(this.txtFirstNumber);
			this.Controls.Add(this.lblFirstNumber);
			this.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.Margin = new System.Windows.Forms.Padding(6);
			this.Name = "Form1";
			this.Text = "Nuget Talk Calculator Demo";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label lblFirstNumber;
		private System.Windows.Forms.TextBox txtFirstNumber;
		private System.Windows.Forms.Label lblSecondNumber;
		private System.Windows.Forms.TextBox txtSecondNumber;
		private System.Windows.Forms.CheckBox chkAdd;
		private System.Windows.Forms.CheckBox chkDivide;
		private System.Windows.Forms.CheckBox chkMultiply;
		private System.Windows.Forms.CheckBox chkSubtract;
		private System.Windows.Forms.Button btnAnswer;
		private System.Windows.Forms.Button btnClearAnswers;
		private System.Windows.Forms.TextBox txtAnswers;
	}
}


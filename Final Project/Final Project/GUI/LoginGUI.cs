using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Final_Project
{
    public partial class frmLogin : Form
    {

        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == "")
            {
                MessageBox.Show("Username cannot be empty");
                return;
            }
            else if (txtPassword.Text == "")
            {
                MessageBox.Show("Password cannot be empty");
                return;
            }else if(txtPassword.Text.Contains(" "))
            {
                MessageBox.Show("Wrong username or password");
                return;
            }
            User user = new User();
            user.Userid = txtUser.Text;
            user.Password = txtPassword.Text;

            DataTable dt = DAO.GetDataTable("Select * from login where user_id='" + user.Userid + "' and password = '" + user.Password + "'");
            if (dt.Rows.Count != 0)
            {
                user.DisplayName = dt.Rows[0][3].ToString();
                if (dt.Rows[0][2].ToString() == "False")
                {
                    Main frmMain = new Main(user.DisplayName, txtUser.Text);
                    this.Hide();
                    frmMain.Show();
                    //this.Show();
                }
                else
                {
                    ManagerGUI mg = new ManagerGUI();
                    this.Hide();
                    mg.Show();
                    //this.Show();
                }
            }
            else
            {
                MessageBox.Show("Wrong username or password");
            }
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
        }
    }
}

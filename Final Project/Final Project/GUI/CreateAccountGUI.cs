using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Final_Project
{
    public partial class frmCreate : Form
    {
        public frmCreate()
        {
            InitializeComponent();
            comboBox1.SelectedIndex = 0;
            DataTable dt = DAO.GetDataTable("select * from Login");

            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            string username = txtID.Text;
            string password = txtPass.Text;
            string display = txtName.Text;
            string confirm = txtConfirm.Text;

            DataTable dt = DAO.GetDataTable("select count([user_id]) as total from Login where [user_id] = '" + username + "'");

            if (username == "" || password == "" || display == ""|| confirm == "")
            {
                MessageBox.Show("Please Enter all fields");
                return;
            }
            else if (confirm != password)
            {
                MessageBox.Show("Password doesn't match!!");
                return;
            }
            else
            {
                if (dt.Rows[0][0].ToString()=="0")
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Login ([user_id], [password], [user_position], [display_name]) VALUES (@userid,@pass,@pos,@name)");
                    cmd.Parameters.AddWithValue("@userid", txtID.Text);
                    cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@pos", (int)comboBox1.SelectedIndex);
                    DAO.UpdateTable(cmd);
                    MessageBox.Show("Account created!!");
                    txtID.Text = "";
                    txtName.Text = "";
                    txtConfirm.Text = "";
                    txtPass.Text = "";
                }
                else
                {
                    MessageBox.Show("Username already exist!!");
                    return;
                }

            }

 
           
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void frmCreate_Load(object sender, EventArgs e)
        {

        }
    }
}

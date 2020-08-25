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
    public partial class frmAdd : Form
    {
        public frmAdd()
        {
            InitializeComponent();
            DataTable dt2 = DAO.GetDataTable("Select * from Categories");
            cbCat.DataSource = dt2;
            cbCat.ValueMember = "category_id";
            cbCat.DisplayMember = "category_name";

        }

        private void txtPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }


            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtPrice.Text == null || txtName.Text == null || txtDes.Text == null)
            {
                MessageBox.Show("Please fill all the blanks");
                    return;
            }
            else
            {
                int cid = (int)cbCat.SelectedValue;
                double price = double.Parse(txtPrice.Text);
                string des = txtDes.Text;
                string name = txtName.Text;
                DAO.Add(cid, price, name, des);
                MessageBox.Show("Item added");
                this.Close();
                
            }

        }

        private void frmAdd_Load(object sender, EventArgs e)
        {

        }
    }
}

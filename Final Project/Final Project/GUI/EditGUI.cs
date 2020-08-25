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
    public partial class frmEdit : Form
    {
        int itemid;

        public frmEdit(int itemid)
        {
            InitializeComponent();
            string sql = "select item_id, items, price, short_description, category_id " +
                "from items where item_id = " + itemid;
            DataTable dt = DAO.GetDataTable(sql);
            DataRow r = dt.Rows[0];
            txtPrice.Text = r["price"].ToString();
            txtName.Text = r["items"].ToString();
            txtDes.Text = r["short_description"].ToString();
            DataTable dt2 = DAO.GetDataTable("Select * from Categories");
            cbCat.DataSource = dt2;
            cbCat.ValueMember = "category_id";
            cbCat.DisplayMember = "category_name";
            this.itemid = itemid;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtDes.Text == "" || txtPrice.Text == "")
            {
                MessageBox.Show("Please fill in all blanks");
                return;
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update Items set items = @i, price = @p, " +
                           "short_description = @d, category_id = @c WHERE item_id = @iid");
                cmd.Parameters.AddWithValue("@i", txtName.Text);
                cmd.Parameters.AddWithValue("@p", txtPrice.Text);
                cmd.Parameters.AddWithValue("@d", txtDes.Text);
                cmd.Parameters.AddWithValue("@c", cbCat.SelectedValue);
                cmd.Parameters.AddWithValue("@iid", itemid);

                if (DAO.UpdateTable(cmd))
                    MessageBox.Show("Edit member info is succesfull");
            }

        }

        private void frmEdit_Load(object sender, EventArgs e)
        {

        }

        private void txtDes_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtName_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtPrice_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbCat_SelectedIndexChanged(object sender, EventArgs e)
        {

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
    }
}

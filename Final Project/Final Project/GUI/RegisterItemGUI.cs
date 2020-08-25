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
    public partial class EditMenu : Form
    {
        int add;
        public EditMenu()
        {
            InitializeComponent();
            DataTable dt = DAO.GetDataTable("SELECT item_id as ID, Items, Price,short_description as Descriptions, c.category_name as Category from Items i inner join Categories c on i.category_id = c.category_id");
            DataTable dt2 = DAO.GetDataTable("Select * from Categories");
            dataGridView1.DataSource = dt;



            DataGridViewButtonColumn button = new DataGridViewButtonColumn();
            button.Name = "button";
            button.HeaderText = "Edit";
            button.Text = "Edit";
            button.UseColumnTextForButtonValue = true;
            this.dataGridView1.Columns.Add(button);
            dataGridView1.Columns["button"].DisplayIndex = dataGridView1.ColumnCount - 1;

            DataRow r = dt2.NewRow();
            r["category_name"] = "All";
            dt2.Rows.InsertAt(r, 0);
            cbCategory.DataSource = dt2;
            cbCategory.ValueMember = "category_id";
            cbCategory.DisplayMember = "category_name";


        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbCategory.SelectedIndex == 0 )
            {
                DataTable dt = DAO.GetDataTable("SELECT item_id as ID, Items, Price,short_description as Descriptions, c.category_name as Category from Items i inner join Categories c on i.category_id = c.category_id");
                dataGridView1.DataSource = dt;
                dataGridView1.Columns["button"].DisplayIndex = dataGridView1.ColumnCount - 1;
            }
            else
            {
                dataGridView1.DataSource = DAO.GetDataTable("SELECT item_id as ID, Items, Price,short_description as Descriptions, c.category_name as Category from Items i inner join Categories c on i.category_id = c.category_id where c.category_id = " + (int)cbCategory.SelectedValue);
                dataGridView1.Columns["button"].DisplayIndex = dataGridView1.ColumnCount - 1;
            }
        }

     /*   private void btnDelete_Click(object sender, EventArgs e)
        {
            int n = 0;
            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                DataGridViewRow r = dataGridView1.Rows[i];
                if (r.Cells[0].Value != null)
                    if (((bool)r.Cells[0].Value) == true)
                    {
                        MessageBox.Show("Item ID = " + r.Cells[2].Value.ToString());
                        n++;

                        SqlCommand cmd = new SqlCommand("delete from Items where item_id = @n");
                        cmd.Parameters.AddWithValue("@n", (int)r.Cells[2].Value);
                        DAO.UpdateTable(cmd);
                        dataGridView1.Rows.Remove(r);
                        i--;
                    }

            }

            MessageBox.Show(string.Format("Deleted {0} item", n));
        }
        */

        private void btnAdd_Click(object sender, EventArgs e)
        {
            
            frmAdd frm = new frmAdd();
            this.Hide();
            frm.ShowDialog();
            this.Show();
            DataTable dt = DAO.GetDataTable("SELECT item_id as ID, Items, Price,short_description as Descriptions, c.category_name as Category from Items i inner join Categories c on i.category_id = c.category_id");
            dataGridView1.DataSource = dt;
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (dgv.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
            {
                frmEdit f = new frmEdit(int.Parse(dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString()));
    
                if (f.ShowDialog(this) == DialogResult.OK)
                {

                    dataGridView1.DataSource = DAO.GetDataTable("SELECT item_id as ID, Items, Price,short_description as Descriptions, c.category_name as Category from Items i inner join Categories c on i.category_id = c.category_id");                 
                    dataGridView1.Columns["button"].DisplayIndex = dataGridView1.ColumnCount - 1;
                }
            }
        }

        private void EditMenu_Load(object sender, EventArgs e)
        {

        }
    }
}

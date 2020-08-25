using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Final_Project.GUI
{
    public partial class HistoryGUI : Form
    {
        public HistoryGUI()
        {
            InitializeComponent();
        }

        private void History_Load(object sender, EventArgs e)
        {
            DataTable dt = DAO.GetDataTable("Select o.order_id as OrderID, o.tbl_id as TableID, l.display_name as Cashier, " +
                "o.created as Date,o.total as Total from Orders o, Login l where l.user_id=o.user_id");
            dataGridView1.DataSource = dt;

            DataGridViewButtonColumn button = new DataGridViewButtonColumn();
            button.Name = "view";
            button.HeaderText = "View";
            button.Text = "View";
            button.UseColumnTextForButtonValue = true;
            this.dataGridView1.Columns.Add(button);
            dataGridView1.Columns["view"].DisplayIndex = dataGridView1.ColumnCount - 1;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (dgv.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
            {
                HistoryDetailGUI hs = new HistoryDetailGUI(
                dgv.Rows[e.RowIndex].Cells[0].Value.ToString(),
                dgv.Rows[e.RowIndex].Cells[1].Value.ToString(),
                dgv.Rows[e.RowIndex].Cells[2].Value.ToString(),
                dgv.Rows[e.RowIndex].Cells[3].Value.ToString(),
                dgv.Rows[e.RowIndex].Cells[4].Value.ToString());
                hs.Show();
            }
        }
    }
}

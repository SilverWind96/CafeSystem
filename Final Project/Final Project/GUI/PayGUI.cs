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
    public partial class Pay : Form
    {
        DataTable dt;
        public List<Item> OrderDetails { get; set; }
        string name;
        int tableNumber;
        string user_id;
        public Pay(DataTable dt, List<Item> orderDetail, string name, int tableNumber, string user_id)
        {
            this.user_id = user_id;
            this.dt = dt;
            this.name = name;
            this.tableNumber = tableNumber;
            this.OrderDetails = orderDetail;
            InitializeComponent();
            dgvOrder.DataSource = dt;
        }

        private void Pay_Load(object sender, EventArgs e)
        {
            lblTable.Text = "Table " + tableNumber;
            int total = 0;
            if (dgvOrder.Rows.Count != 0)
            {
                foreach (DataGridViewRow row in dgvOrder.Rows)
                {
                    total += Int32.Parse(row.Cells[2].Value.ToString()) * Int32.Parse(row.Cells[1].Value.ToString());
                }
                lblTotal.Text = total + "";
            }
        }

        private void btnPay_Click(object sender, EventArgs e)
        {
            //string s = "";
            if (dgvOrder.Rows.Count != 0)
            {
                DAO.InsertOrder(tableNumber, user_id, Int32.Parse(lblTotal.Text));
                DataTable dt0 = DAO.GetDataTable("select top 1 * from Orders Order by order_id desc");

                int orderID = Int32.Parse(dt0.Rows[0][0].ToString());
                foreach (Item item in OrderDetails)
                {
                    //s += orderID + " " + item.ToString() + "\n";
                    DAO.InsertOrderDetails(orderID, item.Id, item.Quantity);
                }
                OrderDetails.Clear();
                MessageBox.Show("Success");
                //MessageBox.Show(s);
                dt.Clear();
                this.Close();
                
            }
            else
            {
                MessageBox.Show("No item selected");
            }
        }
    }
}

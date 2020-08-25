using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Final_Project
{
    public partial class Table : UserControl
    {
        DataTable dt;
        public List<Item> OrderDetails { get; set; }
        int tableNumber;
        string name;
        string user_id;
        public Table(string name,string user_id)
        {

            this.user_id = user_id;
            this.name = name;
            InitializeComponent();
            dt = new DataTable();
            OrderDetails = new List<Item>();
            dt.Columns.Add("Name");
            dt.Columns.Add("Price");
            dt.Columns.Add("Quantity");
        }

        private void Table_Load(object sender, EventArgs e)
        {

        }
        public void setTableNumber(int number)
        {
            label1.Text = "Table " + number;
            this.tableNumber = number;
        }
        public int getTableNumber()
        {
            return this.tableNumber;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Order o = new Order(dt, OrderDetails, name, tableNumber);
            o.ShowDialog();
        }


        private void btnPay_Click(object sender, EventArgs e)
        {
            Pay p = new Pay(dt, OrderDetails, name, tableNumber, user_id);
            p.ShowDialog();
        }

        private void btnOrder_Click(object sender, EventArgs e)
        {
            Order o = new Order(dt, OrderDetails, name, tableNumber);
            o.ShowDialog();
        }
    }
}

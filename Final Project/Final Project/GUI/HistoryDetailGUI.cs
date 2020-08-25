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
    public partial class HistoryDetailGUI : Form
    {
        public HistoryDetailGUI(string OrderID, string tableID, string Cashier,string created, string total)
        {
            InitializeComponent();
            lblCashier.Text = Cashier;
            lblTable.Text = tableID;
            lblTotal.Text = total;
            lblOrderID.Text = OrderID;
            lblDate.Text = created;
            DataTable dt = DAO.GetDataTable("select i.Items as Name, od.quantity as Quantity, i.Price as OneItemPrice" +
                " from Order_details od, Items i where od.item_id=i.item_id and od.order_id='"+OrderID+"'");
            dataGridView1.DataSource = dt;
        }
    }
}

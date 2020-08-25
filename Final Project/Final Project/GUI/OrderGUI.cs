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
    public partial class Order : Form
    {
        DataTable dtx;
        public List<int> ListId { get; set; }
        public List<Item> ListItems { get; set; }
        public List<Item> OrderDetails { get; set; }
        string name;
        int tableNumber;
        public Order(DataTable dtx, List<Item> orderDetail, string name, int tableNumber)
        {
            this.dtx = dtx;
            this.OrderDetails = orderDetail;
            this.name = name;
            this.tableNumber = tableNumber;

            ListId = new List<int>();
            ListItems = new List<Item>();
            InitializeComponent();

            
            DataTable dt1 = DAO.GetDataTable("Select item_id, Items, Price from Items");
            foreach (DataRow dataRow in dt1.Rows)
            {
                ListItems.Add(new Item
                {
                    Id = int.Parse(dataRow["item_id"].ToString()),
                    Price = int.Parse(dataRow["Price"].ToString()),
                    Name = dataRow["Items"].ToString(),
                });
            }
            DataTable dt0 = DAO.GetDataTable("Select  Items as Name, Price from Items");
            dgvMenu.DataSource = dt0;

            DataTable dt = DAO.GetDataTable("Select * from Categories");
            DataRow row = dt.NewRow();
            row["category_name"] = "All";
            dt.Rows.InsertAt(row, 0);
            cbCategory.DataSource = dt;
            cbCategory.DisplayMember = "category_name";
            cbCategory.ValueMember = "category_id";

            DataGridViewButtonColumn button = new DataGridViewButtonColumn
            {
                Name = "button",
                HeaderText = "Add",
                Text = "Add",
                UseColumnTextForButtonValue = true //dont forget this line
            };
            this.dgvMenu.Columns.Add(button);
            dgvMenu.Columns["button"].DisplayIndex = dgvMenu.ColumnCount - 1;



        }


        private void Order_Load(object sender, EventArgs e)
        {
            lblTable.Text = "Table " + tableNumber;
            dgvOrder.DataSource = dtx;
            DataGridViewButtonColumn button2 = new DataGridViewButtonColumn();
            button2.Name = "button2";
            button2.HeaderText = "Remove";
            button2.Text = "Remove";
            button2.UseColumnTextForButtonValue = true; //dont forget this line
            this.dgvOrder.Columns.Add(button2);
            dgvOrder.Columns["button2"].DisplayIndex = dgvOrder.ColumnCount - 1;
            updateTotal();
        }



        private void dgvMenu_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            int index = -1;
            for (int i = 0; i < dgvOrder.Rows.Count; i++)
            {
                if (dgvOrder.Rows[i].Cells["Name"].Value.ToString() == dgv.Rows[e.RowIndex].Cells[1].Value.ToString())
                {
                    index = i;
                }
            }
            if (index != -1)
            {
                int quant = int.Parse(dgvOrder.Rows[index].Cells["Quantity"].Value.ToString());
                dgvOrder.Rows[index].Cells["Quantity"].Value = quant + 1;
                OrderDetails[index].Quantity++;
            }
            else
            {
                if (dgv.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
                {
                    dtx.Rows.Add(dgv.Rows[e.RowIndex].Cells[1].Value.ToString(),
                        dgv.Rows[e.RowIndex].Cells[2].Value.ToString(),
                        1);

                    Item item = ListItems[e.RowIndex];
                    OrderDetails.Add(item);
                }
            }
            updateTotal();
            dgvOrder.DataSource = dtx;
        }

        void updateTotal()
        {
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

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbCategory.SelectedIndex != 0)
            {
                dgvMenu.DataSource = DAO.GetDataTable("Select Items, Price from Items where category_id=" + cbCategory.SelectedValue);
            }
            else
            {
                dgvMenu.DataSource = DAO.GetDataTable("Select Items, Price from Items");
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (cbCategory.SelectedIndex != 0)
            {
                dgvMenu.DataSource = DAO.GetDataTable("Select Items, Price from Items where category_id="
                    + cbCategory.SelectedValue + " and Items Like '%" + txtSearch.Text + "%'");
            }
            else
            {
                dgvMenu.DataSource = DAO.GetDataTable("Select Items, Price from Items where Items Like '%" + txtSearch.Text + "%'");
            }
        }

        private void lblTotal_Click(object sender, EventArgs e)
        {

        }

        private void dgvOrder_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (dgv.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
            {
                foreach (DataGridViewCell oneCell in dgvOrder.SelectedCells)
                {
                    if (oneCell.Selected)
                    {
                        int quant = int.Parse(dgvOrder.Rows[oneCell.RowIndex].Cells["Quantity"].Value.ToString());
                        string nameRemove = dgvOrder.Rows[oneCell.RowIndex].Cells["Name"].Value.ToString();
                        if (quant == 1)
                        {
                            dgvOrder.Rows.RemoveAt(oneCell.RowIndex);
                            foreach (Item item in OrderDetails)
                            {
                                if (item.Name == nameRemove)
                                {
                                    OrderDetails.Remove(item);
                                    break;
                                }
                            }
                            if (dgvOrder.Rows.Count == 0)
                                lblTotal.Text = "0";
                            updateTotal();
                            return;
                        }
                        dgvOrder.Rows[oneCell.RowIndex].Cells["Quantity"].Value = quant + (-1);
                        foreach (Item item in OrderDetails)
                        {
                            if (nameRemove == item.Name)
                            {
                                OrderDetails.Add(new Item
                                {
                                    Id = item.Id,
                                    Name = item.Name,
                                    Quantity = item.Quantity - 1,
                                    Price = item.Price
                                });
                                OrderDetails.Remove(item);
                                break;
                            }
                        }
                        updateTotal();
                    }
                }
            }
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}

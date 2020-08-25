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
    public partial class Main : Form
    {
        Table[] tb = new Table[6];
        string name;
        string user_id;
        public Main(string displayName, string user_id)
        {
            this.name = displayName;
            this.user_id = user_id;
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            lblCashier.Text = name;
            int width = 3;
            int height = 2;
            for (int x = 0; x < width * height; x++)
            {
                Table t = new Table(name, user_id);
                t.setTableNumber(x + 1);
                tb[x] = t;
                panel1.Controls.Add(tb[x]);
            }

        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            this.Close();
            frmLogin frmlogin = new frmLogin();
            frmlogin.Show();

        }
    }
}

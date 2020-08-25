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
    public partial class ManagerGUI : Form
    {
        public ManagerGUI()
        {
            InitializeComponent();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            frmCreate frm = new frmCreate();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

            EditMenu frm = new EditMenu();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void btnHistory_Click(object sender, EventArgs e)
        {

            GUI.HistoryGUI frm = new GUI.HistoryGUI();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void ManagerGUI_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmLogin frm = new frmLogin();
            this.Close();
            frm.ShowDialog();
        }
    }
}

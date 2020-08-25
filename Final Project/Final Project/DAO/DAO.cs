using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows;

namespace Final_Project
{
    class DAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static public DataTable GetDataTable(string sqlSelect)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }

        }

        public static DataTable GetDataTable(SqlCommand cmd)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.Connection = new SqlConnection(strConn);
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];
                return dt;
            }
            catch
            {
                return null;
            }
        }

        static public bool UpdateTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }

        }

        public static bool Add(int cid, double price, string name, string des)
        {

            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("INSERT INTO Items ([Items],[Price],[short_description],[category_id]) VALUES (@item, @price, @description, @cid)");
            cmd.Parameters.AddWithValue("@item", name);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.Parameters.AddWithValue("@description", des);
            return DAO.UpdateTable(cmd);
        }

        public static bool InsertOrder(int table, string user, int total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("INSERT INTO Orders([tbl_id],[user_id],[created],[total]) VALUES(@tbl, @user, getdate(), @total)");
            cmd.Parameters.AddWithValue("@tbl", table);
            cmd.Parameters.AddWithValue("@user", user);
            cmd.Parameters.AddWithValue("@total", total);
            return DAO.UpdateTable(cmd);
        }
        public static bool InsertOrderDetails(int order_id, int item_id, int quantity)
        {
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("INSERT INTO Order_details(order_id, item_id, quantity) VALUES(@Oid,@Iid,@q)");
            cmd.Parameters.AddWithValue("@Oid", order_id);
            cmd.Parameters.AddWithValue("@Iid", item_id);
            cmd.Parameters.AddWithValue("@q", quantity);
            return DAO.UpdateTable(cmd);
        }
    }

}


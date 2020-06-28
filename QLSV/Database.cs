using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace QLSV
{
    public class Database
    {
        private string connectionString = @"Data Source=VUHUYNHAT\SQLEXPRESS;Initial Catalog=QLSV;Integrated Security=True";
        private SqlConnection cnn;
        private DataTable dt;
        private SqlCommand cmd;
        public Database()
        {
            try
            {
                cnn = new SqlConnection(connectionString);
            }
            catch (Exception ex)
            {
                MessageBox.Show("connected faided:" + ex.Message);
            }
        }

        internal object SelectData()
        {
            throw new NotImplementedException();
        }

        public DataTable SelectData(string sql,List<Customparameter>lstPara)
        {
            try
            {
                cnn.Open();
                cmd = new SqlCommand(sql, cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var para in lstPara)
                {
                    cmd.Parameters.AddWithValue(para.key,para.value);
                }
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load dữ liệu:" + ex.Message);
                return null;
            }
            finally
            {
                cnn.Close();
            }
        }

        public DataRow Select(string sql)
        {
            try
            {
                cnn.Open();
                cmd = new SqlCommand(sql, cnn);               
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt.Rows[0];
            }
            catch (Exception ex)
            {

                MessageBox.Show("Lỗi load thông tin chi tiết: " + ex.Message);
                return null;
            }
            finally
            {
                cnn.Close();
            }
        }

        public int ExeCute(string sql,List<Customparameter>lstPara)
        {
            try
            {
                cnn.Open();
                cmd = new SqlCommand(sql, cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var p in lstPara)
                {
                    cmd.Parameters.AddWithValue(p.key,p.value);
                }
                var rs = cmd.ExecuteNonQuery();
                return (int)rs;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi thực thi câu lệnh" + ex.Message);
                return -100;
            }
            finally
            {
                cnn.Close();
            }
        }
    }
}

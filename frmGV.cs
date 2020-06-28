using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLSV
{
    public partial class frmGV : Form
    {
        public frmGV(string mgv)
        {
            this.mgv = mgv;
            InitializeComponent();
        }
        private string mgv;
        private string nguoithucthi="admin";
        private void frmGV_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(mgv))
            {
                this.Text = "Thêm mới giáo viên";
            }
            else
            {
                this.Text = "Cập nhập giáo viên";
                var r = new Database().Select("selectGV'" + int.Parse(mgv) + "'");
                txtHo.Text = r["ho"].ToString();
                txtTenDem.Text = r["tendem"].ToString();
                txtTen.Text = r["ten"].ToString();
                rbtNam.Checked = r["gioitinh"].ToString() == "1" ? true : false;
                mtbNgaySinh.Text = r["ngsinh"].ToString();
                txtDienThoai.Text = r["dienthoai"].ToString();
                txtEmail.Text = r["email"].ToString();
                txtDiaChi.Text = r["diachi"].ToString();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            DateTime ngaysinh;
            List<Customparameter> lstPara = new List<Customparameter>();
            try
            {
                ngaysinh = DateTime.ParseExact(mtbNgaySinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch 
            {
                MessageBox.Show("Ngày sinh không hợp lệ");
                mtbNgaySinh.Select();
                return;
                
            }
            if (string.IsNullOrEmpty(mgv))
            {
                sql = "InsertGV";
                lstPara.Add(new Customparameter()
                {
                    key = "@nguoitao",
                    value = nguoithucthi
                });
            }
            else
            {
                sql = "updateGV";
                lstPara.Add(new Customparameter() { 
                   key="@nguoicapnhap",
                   value=nguoithucthi
                });
                lstPara.Add(new Customparameter()
                {
                    key = "@magiaovien",
                    value = mgv
                });
            }
            lstPara.Add(new Customparameter()
            {
                key = "@ho",
                value = txtHo.Text
            });
            lstPara.Add(new Customparameter()
            {
                key = "@tendem",
                value = txtTenDem.Text
            });
            lstPara.Add(new Customparameter()
            {
                key = "@ten",
                value = txtTen.Text
            });
            lstPara.Add(new Customparameter()
            {
                key = "@ngaysinh",
                value = ngaysinh.ToString("yyyy-MM-dd")
            });
            lstPara.Add(new Customparameter()
            {
                key = "@gioitinh",
                value = rbtNam.Checked?"1":"0"
            });
            lstPara.Add(new Customparameter()
            {
                key = "@email",
                value = txtEmail.Text
            });
            lstPara.Add(new Customparameter()
            {
                key = "@dienthoai",
                value = txtDienThoai.Text
            });
            lstPara.Add(new Customparameter()
            {
                key = "@diachi",
                value = txtDiaChi.Text
            });


            var rs = new Database().ExeCute(sql, lstPara);
            if (rs==1)
            {
                if (string.IsNullOrEmpty(mgv))
                {
                    MessageBox.Show("Thêm mới giáo viên thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhập giáo viên thành công");
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Thực thi truy vấn thất bại");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}

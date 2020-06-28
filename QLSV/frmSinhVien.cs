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
    public partial class frmSinhVien : Form
    {
        public frmSinhVien(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }
        private string msv;
        private void frmSinhVien_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(msv))
            {
                this.Text = "Thêm mới sinh viên";
            }
            else
            {
                this.Text = "Cập nhập thông tin sinh viên";
                var r = new Database().Select("selectSV'"+msv+"'");
               //MessageBox.Show(r[0].ToString());
                txtHo.Text = r["ho"].ToString();
                txtTenDem.Text = r["tendem"].ToString();
                txtTen.Text = r["ten"].ToString();
                mtbNgaySinh.Text = r["ngsinh"].ToString();
                if (int.Parse(r["gioitinh"].ToString()) == 1)
                {
                    rbtNam.Checked = true;
                }
                else
                {
                    rbtNu.Checked = true;
                }

                txtQuequan.Text = r["quequan"].ToString();
                txtDiaChi.Text = r["diachi"].ToString();
                txtDienThoai.Text = r["dienthoai"].ToString();
                txtEmail.Text = r["email"].ToString();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            string ho = txtHo.Text;
            string tendem = txtTenDem.Text;
            string ten = txtTen.Text;

            DateTime ngaysinh;
            try
            {
                ngaysinh = DateTime.ParseExact(mtbNgaySinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception)
            {
                MessageBox.Show("Ngày sinh không hợp lệ");
                mtbNgaySinh.Select();
                return;
            }
            string gioitinh = rbtNam.Checked ? "1" : "0";
            string quequan = txtQuequan.Text;
            string diachi = txtDiaChi.Text;
            string dienthoai = txtDienThoai.Text;
            string email = txtEmail.Text;

            List<Customparameter> lstPara = new List<Customparameter>();
            if (string.IsNullOrEmpty(msv))
            {
                sql = "ThemMoiSV";
               
            }
            else
            {
                sql = "updateSV";
                lstPara.Add(new Customparameter()
                {
                    key = "@masinhvien",
                    value = msv
                });
            }
            lstPara.Add(new Customparameter() { 
                key="@ho",
                value=ho
            });
            lstPara.Add(new Customparameter()
            {
                key = "@tendem",
                value = tendem
            });
            lstPara.Add(new Customparameter()
            {
                key = "@ten",
                value = ten
            });
            lstPara.Add(new Customparameter()
            {
                key = "@ngaysinh",
                value = ngaysinh.ToString("yyyy-MM-dd")
            });
            lstPara.Add(new Customparameter()
            {
                key = "@gioitinh",
                value = gioitinh
            });
            
            lstPara.Add(new Customparameter()
            {
                key = "@quequan",
                value = quequan
            });
            lstPara.Add(new Customparameter()
            {
                key = "@diachi",
                value = diachi
            });
            lstPara.Add(new Customparameter()
            {
                key = "@dienthoai",
                value = dienthoai
            });
            lstPara.Add(new Customparameter()
            {
                key = "@email",
                value = email
            });
            var rs = new Database().ExeCute(sql, lstPara);
            if (rs==1)
            {
                if (string.IsNullOrEmpty(msv))
                {
                    MessageBox.Show("Thêm mới sinh viên thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhập thông tin sinh viên Thành công");
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Thực thi không thành công");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}

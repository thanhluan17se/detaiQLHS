using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLSV
{
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }
        public string tendangnhap = "";
        public string loaitk;
        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            #region ktra_rbuoc
            if (cbbLoaiTaiKhoan.SelectedIndex<0)
            {
                MessageBox.Show("Vui lòng chọn loại tài khoản", "Tài khoản không thể để trống");
                return;
            }
            if (string.IsNullOrEmpty(txtTenDangNhap.Text))
            {
                MessageBox.Show("Vui lòng chọn tài khoản");
                txtTenDangNhap.Select();
                return;
            }
            if (string.IsNullOrEmpty(txtMatKhau.Text))
            {
                MessageBox.Show("Vui lòng nhập mật khẩu","Mật khẩu không thể để trống");
            }
            #endregion
            tendangnhap = txtTenDangNhap.Text;
             loaitk = "";
            #region swtk
            switch (cbbLoaiTaiKhoan.Text)
            {
                case "Quản trị viên":
                    loaitk = "admin";
                    break;
                 
                case "Giáo viên":
                    loaitk = "GV";
                    break;
                  
                case "Sinh viên":
                    loaitk = "SV";
                    break;
            }
            #endregion

            List<Customparameter> lst = new List<Customparameter>()
             {
                 new Customparameter()
                 {
                     key="@loaitaikhoan",
                     value=loaitk
                 },
                 new Customparameter()
                 {
                     key="@taikhoan",
                     value=txtTenDangNhap.Text
                 },
                 new Customparameter()
                 {
                     key="@matkhau",
                     value=txtMatKhau.Text
                 }
             };


            var rs = new Database().SelectData("dangnhap",lst);
            if (rs.Rows.Count>0)
            {
                
                this.Hide();
            }
            else
            {
                MessageBox.Show("Vui lòng khiểm tra lại tên đăng nhập hoặc mật khẩu","tài khoản hoặc mật khẩu không hợp lệ");
            }
            
        }

       
    }
}

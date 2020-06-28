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
    public partial class frmLopHoc : Form
    {
        public frmLopHoc(string malophoc)
        {
            this.malophoc = malophoc;
            InitializeComponent();
        }
        private string malophoc;
        private Database db;
        private string nguoithuchien = "admin";
        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void frmLopHoc_Load(object sender, EventArgs e)
        {
            db = new Database();
            List<Customparameter> lst = new List<Customparameter>()
                {
                    new Customparameter()
                    {
                        key="@tukhoa",
                        value=""
                    }
                };
            cbbMonHoc.DataSource = db.SelectData("selectAllMonHoc", lst);
            cbbMonHoc.DisplayMember = "tenmonhoc";
            cbbMonHoc.ValueMember = "mamonhoc";
            cbbMonHoc.SelectedIndex = -1;


            cbbGiaoVien.DataSource = db.SelectData("selectAllGV", lst);
            cbbGiaoVien.DisplayMember = "hoten";
            cbbGiaoVien.ValueMember = "magiaovien";
            cbbGiaoVien.SelectedIndex = -1;


            if (string.IsNullOrEmpty(malophoc))
            {                              
                this.Text = "Thêm mới lớp học ";
            }
            else
            {
                this.Text = "Cập nhật lớp học";
                var r = db.Select("exec selectLopHoc '" + malophoc + "'");
                cbbGiaoVien.SelectedValue = r["magiaovien"].ToString();
                cbbMonHoc.SelectedValue = r["mamonhoc"].ToString();

            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            if (cbbGiaoVien.SelectedIndex<0)
            {
                MessageBox.Show("Vui lòng chọn giáo viên");
                return;
            }
            if (cbbMonHoc.SelectedIndex<0)
            {
                MessageBox.Show("Vui lòng chọn môn học");
                return;
            }
            List<Customparameter> lst = new List<Customparameter>();
            if (string.IsNullOrEmpty(malophoc))
            {
                sql = "insertLopHoc";
                lst.Add(new Customparameter()
                {
                    key = "@nguoitao",
                    value = nguoithuchien
                });
            }
            else
            {
                sql = "updatelophoc";
                lst.Add(new Customparameter()
                {
                    key = "@nguoicapnhap",
                    value = nguoithuchien
                });
                lst.Add(new Customparameter()
                {
                    key = "@malophoc",
                    value = malophoc
                });               
            }



            lst.Add(new Customparameter()
            {
                key = "@mamonhoc",
                value = cbbMonHoc.SelectedValue.ToString()
            });
            lst.Add(new Customparameter()
            {
                key = "@magiaovien",
                value = cbbGiaoVien.SelectedValue.ToString()
            });
            var kq = db.ExeCute(sql, lst);
            if (kq == 1)
            {
                if (string.IsNullOrEmpty(malophoc))
                {
                    MessageBox.Show("Thêm mới lớp học thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhập lớp học thành công");
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Lưu kết quả thất bại");
            }
        }
    }
}

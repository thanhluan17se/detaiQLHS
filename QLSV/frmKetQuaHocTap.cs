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
    public partial class frmKetQuaHocTap : Form
    {
        public frmKetQuaHocTap(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }
        private string msv;

        private void frmKetQuaHocTap_Load(object sender, EventArgs e)
        {
            loadKQHT();
            dgvKQHT.Columns["mamonhoc"].HeaderText = "Mã học phần";
            dgvKQHT.Columns["tenmonhoc"].HeaderText = "Tên học phần";
            dgvKQHT.Columns["lanhoc"].HeaderText = "Lần học";
            dgvKQHT.Columns["gvien"].HeaderText = "Giáo viên";
            dgvKQHT.Columns["diemlan1"].HeaderText = "Điểm lần 1";
            dgvKQHT.Columns["diemlan2"].HeaderText = "Điểm lần 2";
        }
        private void loadKQHT()
        {
            List<Customparameter> lstPara = new List<Customparameter>();
            lstPara.Add(new Customparameter() { 
                key="@masinhvien",
                value=msv
            });
            lstPara.Add(new Customparameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });
            dgvKQHT.DataSource = new Database().SelectData("tracuudiem", lstPara);
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            loadKQHT();
        }
    }
}

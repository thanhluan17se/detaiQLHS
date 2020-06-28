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
    public partial class frmQuanLyLop : Form
    {
        public frmQuanLyLop(string mgv)
        {
            this.mgv = mgv;
            InitializeComponent();
        }
        private string mgv;

        private void loadDSLop()
        {
            List<Customparameter> lstPAra = new List<Customparameter>();
            lstPAra.Add(new Customparameter()
            {
                key = "@magiaovien",
                value = mgv
            });
            lstPAra.Add(new Customparameter()
            {
                key = "@tukhoa",
                value = txtTimKiem.Text
            });
            dgvTraCuuLop.DataSource = new Database().SelectData("tracuulop", lstPAra);
        }

        private void frmQuanLyLop_Load(object sender, EventArgs e)
        {
            loadDSLop();
            dgvTraCuuLop.Columns["malophoc"].HeaderText = "Mã lớp học";
            dgvTraCuuLop.Columns["mamonhoc"].HeaderText = "Mã môn học";
            dgvTraCuuLop.Columns["tenmonhoc"].HeaderText = "Tên môn học học";
            dgvTraCuuLop.Columns["sotinchi"].HeaderText = "Số tín chỉ";
            dgvTraCuuLop.Columns["siso"].HeaderText = "Sĩ số";
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            loadDSLop();
        }
    }
}

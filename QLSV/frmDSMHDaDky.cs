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
    public partial class frmDSMHDaDky : Form
    {
        private string masv;
        public frmDSMHDaDky(string masv)
        {
            this.masv = masv;
            InitializeComponent();
        }

        private void frmDSMHDaDky_Load(object sender, EventArgs e)
        {
            loadMonDky();
        }
        private void loadMonDky()
        {
            List<Customparameter> lstPara = new List<Customparameter>();
            lstPara.Add(new Customparameter()
            {
                key = "@masinhvien",
                value = masv
            });
            lstPara.Add(new Customparameter()
            {
                key = "@tukhoa",
                value = txtTimKiem.Text
            }); 

            dgvDSMHDangKy.DataSource = new Database().SelectData("monDaDky",lstPara);
        }

        private void btnDKyMoi_Click(object sender, EventArgs e)
        {
            new frmDangkyMonhoc(masv).ShowDialog();
            loadMonDky();
        }
     
        private void btnTmKiem_Click(object sender, EventArgs e)
        {          
            loadMonDky();
        }
    }
}

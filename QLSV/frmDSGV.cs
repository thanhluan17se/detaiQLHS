﻿using System;
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
    public partial class frmDSGV : Form
    {
        public frmDSGV()
        {
            InitializeComponent();
        }

        
        private string tukhoa = "";

        private void loadDSGV()
        {
            string sql = "selectAllGV";
            List<Customparameter> lstPara = new List<Customparameter>();
            lstPara.Add(new Customparameter() { 
                key="@tukhoa",
                value = tukhoa
            });
            dgvDSGV.DataSource = new Database().SelectData(sql, lstPara);
            dgvDSGV.Columns["magiaovien"].HeaderText = "Mã GV";
            dgvDSGV.Columns["hoten"].HeaderText = "Họ và tên";       
            dgvDSGV.Columns["gt"].HeaderText = "Giới tính";
            dgvDSGV.Columns["diachi"].HeaderText = "Địa chỉ";
            dgvDSGV.Columns["dienthoai"].HeaderText = "Điện thoại";
            dgvDSGV.Columns["email"].HeaderText = "Email";
        }

        private void frmDSGV_Load(object sender, EventArgs e)
        {
            loadDSGV();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTimKiem.Text;
            loadDSGV();
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmGV(null).ShowDialog();
            loadDSGV();
        }

        private void dgvDSGV_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex>=0)
            {
                var mgv = dgvDSGV.Rows[e.RowIndex].Cells["magiaovien"].Value.ToString();
                new frmGV(mgv).ShowDialog();
                loadDSGV();
            }
        }
    }
}

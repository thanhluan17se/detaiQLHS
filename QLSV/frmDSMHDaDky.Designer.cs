namespace QLSV
{
    partial class frmDSMHDaDky
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvDSMHDangKy = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.btnTmKiem = new System.Windows.Forms.Button();
            this.btnDKyMoi = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSMHDangKy)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvDSMHDangKy
            // 
            this.dgvDSMHDangKy.AllowUserToAddRows = false;
            this.dgvDSMHDangKy.AllowUserToDeleteRows = false;
            this.dgvDSMHDangKy.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvDSMHDangKy.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDSMHDangKy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDSMHDangKy.Location = new System.Drawing.Point(-2, 117);
            this.dgvDSMHDangKy.MultiSelect = false;
            this.dgvDSMHDangKy.Name = "dgvDSMHDangKy";
            this.dgvDSMHDangKy.ReadOnly = true;
            this.dgvDSMHDangKy.RowHeadersWidth = 51;
            this.dgvDSMHDangKy.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDSMHDangKy.Size = new System.Drawing.Size(1016, 334);
            this.dgvDSMHDangKy.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(338, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Từ khóa";
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTimKiem.Location = new System.Drawing.Point(391, 42);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(307, 20);
            this.txtTimKiem.TabIndex = 2;
            // 
            // btnTmKiem
            // 
            this.btnTmKiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTmKiem.Location = new System.Drawing.Point(718, 42);
            this.btnTmKiem.Name = "btnTmKiem";
            this.btnTmKiem.Size = new System.Drawing.Size(90, 23);
            this.btnTmKiem.TabIndex = 3;
            this.btnTmKiem.Text = "Tìm kiếm";
            this.btnTmKiem.UseVisualStyleBackColor = true;
            this.btnTmKiem.Click += new System.EventHandler(this.btnTmKiem_Click);
            // 
            // btnDKyMoi
            // 
            this.btnDKyMoi.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDKyMoi.Location = new System.Drawing.Point(826, 42);
            this.btnDKyMoi.Name = "btnDKyMoi";
            this.btnDKyMoi.Size = new System.Drawing.Size(146, 23);
            this.btnDKyMoi.TabIndex = 3;
            this.btnDKyMoi.Text = "Đăng ký mới";
            this.btnDKyMoi.UseVisualStyleBackColor = true;
            this.btnDKyMoi.Click += new System.EventHandler(this.btnDKyMoi_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnXoa.Location = new System.Drawing.Point(718, 88);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(90, 23);
            this.btnXoa.TabIndex = 3;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.UseVisualStyleBackColor = true;
            this.btnXoa.Click += new System.EventHandler(this.btnTmKiem_Click);
            // 
            // frmDSMHDaDky
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1013, 450);
            this.Controls.Add(this.btnDKyMoi);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnTmKiem);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvDSMHDangKy);
            this.Name = "frmDSMHDaDky";
            this.Text = "Danh sách môn học đã đăng ký";
            this.Load += new System.EventHandler(this.frmDSMHDaDky_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSMHDangKy)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDSMHDangKy;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Button btnTmKiem;
        private System.Windows.Forms.Button btnDKyMoi;
        private System.Windows.Forms.Button btnXoa;
    }
}
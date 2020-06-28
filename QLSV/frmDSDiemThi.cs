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
    public partial class frmDSDiemThi : Form
    {
        public frmDSDiemThi()
        {
            InitializeComponent();
        }

        public static implicit operator frmDSDiemThi(DockStyle v)
        {
            throw new NotImplementedException();
        }

        
    }
}

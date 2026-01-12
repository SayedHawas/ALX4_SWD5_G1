namespace Day3WinFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (
                (txtUserName.Text.Trim() == "sayed" && txtPassword.Text == "1234") ||
                (txtUserName.Text.Trim() == "ahmed" && txtUserName.Text == "222") ||
                (txtUserName.Text.Trim() == "retaj" && txtUserName.Text == "555")
                )
            {
                MainFrm Mfrm = new MainFrm();
                Mfrm.Show();
            }
            else
            {
                MessageBox.Show("UserName Or Password are invalid ...", "Login Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtUserName.Text = txtPassword.Text = string.Empty;
                txtUserName.Focus();
                //txtPassword.Text = string.Empty;
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            txtPassword.PasswordChar = checkBox1.Checked ? '\0' : '*';
            //if (checkBox1.Checked)
            //{
            //    txtPassword.PasswordChar = '\0';
            //}
            //else
            //{
            //    txtPassword.PasswordChar = '*';
            //}
            ;//null; ;
        }
    }
}

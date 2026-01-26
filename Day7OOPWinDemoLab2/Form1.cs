namespace Day7OOPWinDemoLab2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //textBox1.Text = string.Empty;  //"";
            //textBox2.Text = string.Empty;  //"";
            //comboBox1.Text = string.Empty; //"";
            //listBox1.Text = string.Empty;  //"";

            CleanForm(this, "textBox1");


        }

        // Type Can Be DataType 
        // Class
        public void CleanForm(Control frmName, string NameExept)
        {
            foreach (Control item in frmName.Controls)
            {
                if (item is TextBox || item is ComboBox)
                {
                    if (item.Name == NameExept)
                    {

                    }
                    else
                    {
                        item.Text = string.Empty;
                    }
                }
                if (item is GroupBox)
                    CleanForm(item, NameExept);
            }
        }
    }
}

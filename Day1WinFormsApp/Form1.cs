namespace Day1WinFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Welcome " + textBox1.Text);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //DataGridView
            dataGridView1.DataSource = new List<Person>
            {
                new Person { Name = "Alice", Age = 30 },
                new Person { Name = "Bob", Age = 25 },
                new Person { Name = "Charlie", Age = 35 }
            };
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.BackColor = Color.Yellow;
        }
    }

    internal class Person
    {
        public string Name { get; internal set; }
        public int Age { get; internal set; }
    }
}

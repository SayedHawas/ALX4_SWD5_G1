namespace Day12IODemo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        FileStream fs;
        private void Form1_Load(object sender, EventArgs e)
        {
            DriveInfo[] drives = DriveInfo.GetDrives();
            foreach (DriveInfo drive in drives)
            {
                if (drive.DriveType == DriveType.Fixed)
                    comboBox1.Items.Add(drive.Name);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text != string.Empty)
            {
                DriveInfo Di = new DriveInfo(comboBox1.Text);
                MessageBox.Show($"Name {Di.Name} Type: {Di.DriveFormat}  Free Space {Di.AvailableFreeSpace / 1024 / 1024 / 1024} GB");
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var folders = Directory.GetDirectories(comboBox1.Text);
            //listBox1.Items.Clear();
            //foreach (var folder in folders)
            //{
            //    listBox1.Items.Add(folder);
            //}
            listBox1.DataSource = folders;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (!Directory.Exists("Ahmed"))
            {
                Directory.CreateDirectory("Ahmed");
            }

            DirectoryInfo di = new DirectoryInfo("C");
            di.Create();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //File.Create();
            //FileInfo fi = new FileInfo("Path");
            var files = Directory.GetFiles(listBox1.Text);
            listBox2.DataSource = files;
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            pictureBox1.ImageLocation = listBox2.Text;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            //openFileDialog1.Filter = "Image files (*.png)|Text files (*.txt)";
            var filepath = openFileDialog1.FileName;
            MessageBox.Show(filepath);
            //openFileDialog1.OpenFile()
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // to create file By FileStream
            fs = new FileStream(@"smart.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
            // to read the File 
            using (StreamReader sr = new StreamReader(fs))
            {
                richTextBox1.Text = sr.ReadToEnd();
                //sr.Close();
            }

            MessageBox.Show("Open ....");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            // to create file By FileStream
            fs = new FileStream(@"smart.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
            // to write the text 
            using (StreamWriter sw = new StreamWriter(fs))
            {
                sw.Write(richTextBox1.Text);
                //sw.Close();
            }
            MessageBox.Show("Saving ....");
            richTextBox1.Text = string.Empty;
        }
    }
}

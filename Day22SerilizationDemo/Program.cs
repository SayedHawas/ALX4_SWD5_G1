using System.Text.Json;

namespace Day22SerilizationDemo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            Person person = new Person { Name = "John Doe", Age = 30 };

            //// Serialize the object to a file
            //using (FileStream fs = new FileStream("person.dat", FileMode.Create))
            //{
            //    BinaryFormatter formatter = new BinaryFormatter();
            //    formatter.Serialize(fs, person);
            //}

            //// Deserialize the object from the file
            //using (FileStream fs = new FileStream("person.dat", FileMode.Open))
            //{
            //    BinaryFormatter formatter = new BinaryFormatter();
            //    Person deserializedPerson = (Person)formatter.Deserialize(fs);
            //    Console.WriteLine($"Name: {deserializedPerson.Name}, Age: {deserializedPerson.Age}");
            //}

            //stream 
            //XML 
            //using (FileStream fs = new FileStream("person.xml", FileMode.OpenOrCreate, FileAccess.ReadWrite))
            //{
            //    XmlSerializer serializer = new XmlSerializer(typeof(Person));
            //    serializer.Serialize(fs, person);
            //}

            //// De-serialize the object from the file
            //using (FileStream fs = new FileStream("person.xml", FileMode.Open))
            //{
            //    XmlSerializer serializer = new XmlSerializer(typeof(Person));

            //    Person deserializedPerson = (Person)serializer.Deserialize(fs);
            //    Console.WriteLine($"Name: {deserializedPerson.Name}, Age: {deserializedPerson.Age}");
            //}


            // Serialize the object to a JSON string
            string jsonString = JsonSerializer.Serialize(person);
            File.WriteAllText("person.json", jsonString);

            // Deserialize the object from the JSON string
            string jsonStringFromFile = File.ReadAllText("person.json");
            Person deserializedPerson = JsonSerializer.Deserialize<Person>(jsonStringFromFile);
            Console.WriteLine($"Name: {deserializedPerson.Name}, Age: {deserializedPerson.Age}");

        }
    }

    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
    }
}

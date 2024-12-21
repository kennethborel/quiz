using System;
using System.Data.SqlClient;

namespace CrearTablasSQL
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "YourConnectionStringHere"; // Reemplazar con tu cadena de conexión

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Crear la tabla SCHOOL
                    string createSchoolTable = @"
                        CREATE TABLE SCHOOL (
                            SchoolId INT PRIMARY KEY,
                            SchoolName VARCHAR(50),
                            Description VARCHAR(1000) NULL,
                            Address VARCHAR(50) NULL,
                            Phone VARCHAR(50) NULL,
                            PostCode VARCHAR(50) NULL,
                            PostAddress VARCHAR(50) NULL
                        )";

                    // Crear la tabla CLASS
                    string createClassTable = @"
                        CREATE TABLE CLASS (
                            ClassId INT PRIMARY KEY,
                            SchoolId INT FOREIGN KEY REFERENCES SCHOOL(SchoolId),
                            ClassName VARCHAR(50),
                            Description VARCHAR(1000) NULL
                        )";

                    // Ejecutar las sentencias SQL
                    SqlCommand command = new SqlCommand();
                    command.Connection = connection;
                    command.CommandText = createSchoolTable;
                    command.ExecuteNonQuery();

                    command.CommandText = createClassTable;
                    command.ExecuteNonQuery();

                    Console.WriteLine("Tablas creadas exitosamente.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al crear las tablas: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}
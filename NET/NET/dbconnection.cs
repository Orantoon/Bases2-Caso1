using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace NET
{
    class dbconnection
    {
        string chain = "Data Source=DEIBID;Initial Catalog=bases2_caso1; Integrated Security=True";
        public SqlConnection connection = new SqlConnection();

        public dbconnection()
        {
            connection.ConnectionString = chain;
        }

        public void query1()
        {
            try
            {
                SqlCommand command = new SqlCommand("Query1", connection);

                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@canton", 1));
                DataTable dataTable = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                connection.Open();
                dataAdapter.Fill(dataTable);

                foreach (DataRow dataRow in dataTable.Rows)
                {
                    foreach (var item in dataRow.ItemArray)
                    {
                        Console.WriteLine(item);
                    }
                    Console.WriteLine("-------------");
                }

                Console.ReadLine();

            }
            catch (Exception e)
            {
                Console.WriteLine("No se pudo conectar con la base de datos. ERROR: "+e.Message);
            }
        }

        public void query2()
        {
            try
            {
                SqlCommand command = new SqlCommand("Query2", connection);

                command.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                connection.Open();
                dataAdapter.Fill(dataTable);

                foreach (DataRow dataRow in dataTable.Rows)
                {
                    foreach (var item in dataRow.ItemArray)
                    {
                        Console.WriteLine(item);
                    }
                    Console.WriteLine("-------------");
                }

                Console.ReadLine();
            }
            catch (Exception e)
            {
                Console.WriteLine("No se pudo conectar con la base de datos. ERROR: " + e.Message);
            }
        }

        public void query3()
        {
            try
            {
                SqlCommand command = new SqlCommand("Query3", connection);

                command.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                connection.Open();
                dataAdapter.Fill(dataTable);

                foreach (DataRow dataRow in dataTable.Rows)
                {
                    foreach (var item in dataRow.ItemArray)
                    {
                        Console.WriteLine(item);
                    }
                    Console.WriteLine("-------------");
                }

                Console.ReadLine();
            }
            catch (Exception e)
            {
                Console.WriteLine("No se pudo conectar con la base de datos. ERROR: " + e.Message);
            }
        }

        public void close()
        {
            connection.Close();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NET
{
    class Program
    {
        static void Main(string[] args)
        {
            dbconnection connection = new dbconnection();

            connection.query1();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_UP03.EntityDB
{
    public static class DbStorage
    {
        public static AuthDB_Storage DB_s { get; set; } = new AuthDB_Storage();
    }
}

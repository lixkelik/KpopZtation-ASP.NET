using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class Database
    {
        private static DatabaseEntities db = null;

        private Database() { }

        public static DatabaseEntities getDb()
        {
            if(db == null)
            {
                db = new DatabaseEntities();
            }

            return db;
        }
    }
}
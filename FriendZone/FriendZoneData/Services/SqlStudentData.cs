using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services
{
    public class SqlStudentData : IStudentData
    {
        private readonly FriendZoneDBContext db;

        public SqlStudentData()
        {
            db = new FriendZoneDBContext();
        }
        public void Add(Student u)
        {
            db.Students.Add(u);
            db.SaveChanges();
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Student Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Student> GetAll()
        {
            return db.Students;
        }

        public bool Update(Student u)
        {
            throw new NotImplementedException();
        }
    }
}

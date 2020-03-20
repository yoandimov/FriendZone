using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services
{
    public interface IStudentData
    {
        IEnumerable<Student> GetAll();
        Student Get(int id);

        void Add(Student u);
        bool Update(Student u);

        bool Delete(int id);
    }
}

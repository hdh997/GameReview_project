using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace GameREVIEW
{
    public class Hash_Password
    {
        public static String GetHashPassword(string password)
        {
            return HashPassword(password);
        }
        private static string GetSalt(string password)
        {
            byte[] bytePassword = ASCIIEncoding.ASCII.GetBytes(password + password.Length + "SM");
            HashAlgorithm algorith = MD5.Create();
            byte[] byteHashSalth = algorith.ComputeHash(bytePassword);
            return Convert.ToBase64String(byteHashSalth);
        }
        private static string HashPassword(string password)
        {
            byte[] bytePassword = ASCIIEncoding.ASCII.GetBytes(password + GetSalt(password));
            int algorithmNo = password.Length % 3;
            HashAlgorithm algorithm = null;
            switch (algorithmNo)
            {
                case 0:
                    algorithm = MD5.Create();
                    break;

                case 1:
                    algorithm = SHA1.Create();
                    break;

                case 2:
                    algorithm = SHA512.Create();
                    break;
            }
            byte[] byteHashPassword = algorithm.ComputeHash(bytePassword);
            return Convert.ToBase64String(byteHashPassword);

        }
    }
}
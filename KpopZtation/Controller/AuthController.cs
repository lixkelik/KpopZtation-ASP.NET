using KpopZtation.Handler;
using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace KpopZtation.Controller
{
    public class AuthController
    {
        UserHandler userHandler = new UserHandler();
        public static String CheckEmail(String email)
        {
            if(email == null)
            {
                return "Please input email field first!";
            }

            //Check email format
            string emailPattern = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            Regex regex = new Regex(emailPattern);
            Match match = regex.Match(email);
            if (match.Success) return "";

            return "invalid email format!";
        }

        public static String CheckPassword(String password)
        {
            if(password == null) return "Please enter your password!";

            if(password.Length < 5) return "Password must be more than 5 character";

            return "";
        }

        public String CheckName(String name)
        {
            if(name.Length < 5 || name.Length > 50) return "Name length must be < 5 and > 50";
            
            return "";
        }

        public String CheckAddress(String address)
        {
            if (!address.EndsWith("Street") && !address.EndsWith("street")) return "Address must end with Street";

            return "";
        }

        public String CheckGender(String gender)
        {
            if (gender == "Male" || gender == "Female") return "";

            return "Invalid or empty gender! Please select your gender";
        }

        public String CheckAlphaNumeric(String password)
        {
            //Check if password contain alphanumeric using regex
            Regex alphanumericRegex = new Regex("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]+$");
            if (!alphanumericRegex.IsMatch(password))
            {
                return "Please input both number and alphabet!";
            }
            return "";
        }

        public dynamic CheckLogin(String email, String password)
        {
            String response = CheckEmail(email);
            if(response == "") response = CheckPassword(password);

            if (response == "")return userHandler.DoLogin(email, password);
            
            return response;
        }

        public String CheckRegister(String name, String email, String gender, String address, String password)
        {
            String response = CheckName(name);
            if (response == "") response = CheckEmail(email);
            if (response == "") response = CheckGender(gender);
            if (response == "") response = CheckAddress(address);
            if (response == "") response = CheckPassword(password);
            if (response == "") response = CheckAlphaNumeric(password);
            if (response == "") return userHandler.DoRegister(name, email, gender, address, password);

            return response;
        }
    }
}
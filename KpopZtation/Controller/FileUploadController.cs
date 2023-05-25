using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class FileUploadController
    {
        public String IsFileValid(String ext, int fileSize)
        {
            if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".jfif") return "Image extension is not correct!";
            if (fileSize > 2097152) return "Image must be < 2 MB";
            return "";
        }
    }
}
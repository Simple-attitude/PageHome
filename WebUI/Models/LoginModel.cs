using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebUI.Models
{
    public class LoginModel
    {

        [Required]
        [StringLength(11),MinLength(11)]
        public string PhoneNum { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        [StringLength(4), MinLength(4)]
        public string CaptCha { get; set; }
        

    }
}
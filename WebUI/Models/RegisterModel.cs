using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebUI.Models
{
    public class RegisterModel
    {
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        [StringLength(maximumLength:11)]
        public string PhoneNum { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [StringLength(50),MinLength(6)]
        public string Password { get; set; }
        [Required]
        [StringLength(4),MinLength(4)]
        public string CaptCha { get; set; }

    }
}
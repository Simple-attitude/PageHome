﻿using Newtonsoft.Json;
using System;
using System.Web;
using System.Web.Mvc;

namespace MVCHelper
{
    public class JsonNetResult : JsonResult
    {
        public JsonNetResult()
        {
            Settings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                DateFormatString = "yyyy-MM-dd HH:mm:ss",
                ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver()
            };
        }

        public JsonSerializerSettings Settings { get; private set; }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null) throw new ArgumentNullException("context"); 
            if (this.JsonRequestBehavior == JsonRequestBehavior.AllowGet && string.Equals(context.HttpContext.Request.HttpMethod, "GET", StringComparison.OrdinalIgnoreCase))
                throw new InvalidOperationException("JSON GET is not allowed");

            HttpResponseBase response = context.HttpContext.Response;
            response.ContentType = string.IsNullOrEmpty(this.ContentType) ? "application/json" : this.ContentType;

            if (this.ContentEncoding != null) response.ContentEncoding = this.ContentEncoding; if (this.Data == null) return;

            var scriptSerializer = JsonSerializer.Create(this.Settings); scriptSerializer.Serialize(response.Output, this.Data);
        }
    }
}
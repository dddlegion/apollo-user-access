using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Mvc;

namespace Apollo.UserAccess.API.Controllers;

[ApiController]
[Route("/")]
public class HomeController : ControllerBase
{
    [HttpGet()]
    public ContentResult Index()
    {
        return base.Content("<h1>UserAccess service</h1>", "text/html");
    }
}
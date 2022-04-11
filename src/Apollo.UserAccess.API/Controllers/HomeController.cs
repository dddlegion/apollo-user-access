using Microsoft.AspNetCore.Mvc;

namespace Apollo.UserAccess.Controllers;

[ApiController]
[Route("[controller]")]
public class HomeController : ControllerBase
{
    [HttpGet()]
    public IActionResult Index()
    {
        return Ok("I'm ok.");
    }
}
using Apollo.UserAccess.Domain;
using NUnit.Framework;

namespace Apollo.UserAccess.Tests.Unit.Domain;

[TestFixture]
public class UserTests
{
    [Test]
    public void User_ChangesEmail()
    {
        User user = new User("foo@bar.com");
        
        user.ChangeEmail("bar@foo.com");

        Assert.That(user.Email, Is.EqualTo("bar@foo.com"));
    }
}

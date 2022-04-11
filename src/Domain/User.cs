namespace Apollo.UserAccess.Domain;

public class User
{
    public string Email { get; private set; }

    public User(string email)
    {
        Email = email;
    }

    public void ChangeEmail(string email)
    {
        Email = email;
    }
}
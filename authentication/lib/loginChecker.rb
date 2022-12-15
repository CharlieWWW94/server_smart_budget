require "../lib/authenticator.rb"

module LoginChecker
    include Authentication

    def email_check
    if input.length == 0
        return "Please provide a valid email"
    if input.exclude "@"
        return "Please provide a valid email"
    else 
        return input

    end

    def password_check
        if input.length == 0 
            raise "invalid password"
        if password !== secret 
            raise "incorrect password"
        else
            return input

end
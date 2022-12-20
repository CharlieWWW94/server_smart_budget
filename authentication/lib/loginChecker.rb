require "../lib/authenticator.rb"

module LoginChecker
    include Authentication

    def email_check
        if input.length == 0
            return "Please provide a valid email"
        elsif input.exclude "@"
            return "Please provide a valid email"
        else 
            return input
        end
    end
end
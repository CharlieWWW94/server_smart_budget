![Smart Logo](https://github.com/CharlieWWW94/server_smart_budget/blob/main/smart_logo.png?raw=true)

# Setting up the Smart Server.

This repo contains the main Rails server for the Smart budgeting application. This was created as the final project for the Multiverse Software Engineering Bootcamp.

Please follow the below instructions to get set up.

# Requirements

Please ensure you have the following installed on your system:

- Ruby 3.1.3
- Rails 7.0.4
- PostgreSQL 14.5

# After cloning

Ensure that you ```cd``` into the directory named ```smart_budget``` and run ```bundle```. This will install the necessary packages contained in the gem file.

You will also need to set up your database. Ensure that you have your PostgresQL server running - if you are using homebrew on MacOS, the following command will start your postgres server on login: ```brew services start postgresql```.

Once you have started your PostgreSQL server, ```cd``` into the ```smart_budget``` directory and run ```rails create:db``` then ```rails db:schema:load```. This will create your database and necessary tables.

Following this, run ```rails s``` to start the server.

Happy developing!

Happy
=============

## Installation
Create a new rails server

    rails new happy -m https://raw.github.com/RailsApps/rails3-application-templates/master/rails3-haml-html5-template.rb

Navigate to the directory

    cd happy
    
Pull files from github

    git clone git@github.com:itham/to-be-renamed.git .
    
Update and install gems
  
    bundle update && bundle install
    
Create the database

    rake db:migrate
    
Populate the database with test data

    rake db:seed


## Running

### Web Server

    rails server

### Create DB Tables

    rake db:migrate

If migrate doesn't work, try 

    rake db:rollback
  
and then migrate

### Populate DB with test data

    rake db:seed

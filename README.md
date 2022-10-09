#### Volunteer Tracker
## By

* Kasidit Srisawat (Paul)

## Technologies Used

* Ruby 
* Rails 
* Rspec
* Sinatra 
* Postgresql

## Description

This web application allows a project manager to track volunteers for a project with full CRUD functionality.

## Setup/Installation Requirements

- Cloning the repo and running scripts on your local machine

1. Clone the repo to your desired local directory with the below terminal command (you must already have git installed). Open a terminal in your preferred directory and run this command. 
```
$git clone https://github.com/paulkasidit/volunteer_tracker

``` 
2. Open this folder in your VS Code. 
3. Run this command to install required dependencies
``` 
$bundle install
```
4. Run this command to start the server, it will usually be hosted on http://localhost:4567/
``` 
$ruby app.rb
```
5. Run tests for all scripts in the project's root directory with following terminal command
``` 
$rspec 
``` 

## Known Bugs

* Non passing test. Syntax error for test "Project#delete allows a user to delete a project" in project spec file. This is the only test that did not pass.


## License

Any inquiries or issues can be reported to _(kasiditpaul@gmail.com)

MIT License

Copyright (c) 2022 Kasidit Srisawat

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
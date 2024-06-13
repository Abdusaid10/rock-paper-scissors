# Rock-Paper-Scissors Rails App

> This is a web-based Rock-Paper-Scissors game built with Ruby on Rails. The application allows users to play Rock-Paper-Scissors against a server.

Requirements

	•	Ruby 3.0.6
	•	Rails 7.x
	•	PostgreSQL

## Running the Application Locally without Docker

1. Clone the Repository
```bash
git clone https://github.com/yourusername/rock-paper-scissors.git
cd rock-paper-scissors`
```
2. Checkout to game-logic branch
```bash
git checkout game-logic
```
3. Install Dependencies

Install Ruby gems:
```bash
  bundle install
```

Install JavaScript dependencies:

yarn install

4. Configure the Database

Create and configure the PostgreSQL database:
```bash
rails db:create
rails db:migrate
```

5. Run the Rails Server

Start the Rails server:
```bash
rails s
```
Access the application in your browser at http://localhost:3000.

## Running Tests
To run the test suite, use the following command:

```bash
bundle exec rspec
```
Ensure that you have configured the test database and installed all dependencies before running the tests.
## Contributing
Feel free to submit pull requests or open issues to improve the application.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

This README file provides comprehensive instructions for setting up and running the application both locally and with Docker. Make sure to replace yourusername with your actual GitHub username or the correct repository URL.
# Restaurant Reservation API

## Getting Started

Clone the repo, `cd` into the directory and run `bundle install`.

Once all the dependencies are installed, run `rails s` to start the server.

## Setup

To use this API you need to create a user and retrieve a unique authentication token. This token must then be passed
into all requests along with the email address of the user via the headers.

To create a user, run the following seed:

```bash
$ rails db:seed
```

This will create you a user and output the credentials needed in order to use the API.

The format should be:

Key: `X-User-Email` Value: `EMAIL_ADDRESS`

Key: `X-User-Token` Value: `AUTHENTICATION_TOKEN`

By default, the user will be created with `admin` permissions (CRUD access to all models) but this can be changed by
jumping into a `rails console` and manually setting the role to either `restaurant` or `guest`.

## Usage

Firsly, a `Restaurant` needs to be created, followed by a `Guest` and then lastly a `Reservation` that is tied to a
guest.

An example of the payload to send to create a `Restaurant` is:

```ruby
# POST /v1/restaurants
 
{
  "restaurant": {
    "name": "My Awesome Restaurant",
    "cuisines": "American",
    "phone": "01234 56789",
    "email": "my@email.com",
    "opening_times_attributes": [{ "day_of_week": "monday", "opening_time": "12:00", "closing_time": "23:00" }],
    "location": "Detroit"
  }
}
```

An example of the payload to send to create a `Guest` is:

```ruby
# POST /v1/restaurants/1/guests
 
{
  "guest": {
    "first_name": "Mickey",
    "last_name": "Mouse",
    "phone": "1928",
    "email": "mickey.mouse@disney.com"
  }
}
```

An exmaple of the payload to send to create a `Reservation` is:

```ruby
# POST /v1/restaurants/1/guests/1/reservations

{
  "reservation": {
    "status": "pending",
    "start_time": "1576578362", # Epoch
    "covers": "2",
    "notes": "I'm a cartoon character so I can't eat real food"
  }
}
```

A full list of endpoints can be found by running the following command from the root of the project:

```bash
$ rails routes
```

## Tests

To run the test suite, run the following command from the root of the project:

```bash
$ bundle exec rspec spec
```

Factory Bot is used to create mock objects for use within the tests and Faker is used to generate mock data to use within
the mock objects.

## Code Style

Code style is enforced with Rubocop. running `rubocop` from the root of the project should return no warnings or errors.
# Friend Finder API (Backend)

Friend Finder API is a RESTful API built in Rails 5.2.

Please review the below instructions to get the repository up and running on your local machine for development and testing purposes.

The base URL for the API is https://friend-finder-18081-api.herokuapp.com/. <br>
Visit the front end repo  here: https://amypetrie.github.io/friend_finder_fe/.

## Table of Contents

* Endpoint Explanation
* Prerequisites
* Testing Dependencies
* APIs consumed (keys required)
* Additional Gems
* Installation
* Running the Test Suite

## Endpoint Explanation

Base URL: https://friend-finder-18081-api.herokuapp.com/

### Endpoint: `GET api/v1/daily_pet`

This endpoint returns a random pet.

Request Requirements: None

JSON Response:
```
{
    "data": {
        "id":  "current timestamp",
        "type": "pet",
        "attributes": {
            "name": "Sandy",
            "petfinder_id": "43813147",
            "picture_url": "http://photos.petfinder.com/photo.jpg",
            "location": "Orlando, FL",
            "sex": "M",
            "contact_email": "CandysCats@gmail.com",
            "description": "text here"
            "animal_type": "Cat"
        }
    }
}
```

### Endpoint `GET /api/v1/search`

This endpoint returns the first 25 results for a search with queried params that may include location, sex, and type of animal.

Request Requirements:
The request must contain params in the following format.
`{ "location": "<city,state or zipcode>",
   "animal": "dog",
   "sex": "M"
  }`

JSON Response (assume 25 records returned):
```
{
    "data": [
        {
            "id": "2019-02-27 05:51:21 +0000",
            "type": "pet",
            "attributes": {
                "name": "OREO",
                "petfinder_id": "44098675",
                "picture_url": "http://photos.petfinder.com/photos/pets/44098675/1/?bust=1551120283&width=50&-t.jpg",
                "location": "Denver, CO",
                "sex": "M",
                "contact_email": "customercare@ddfl.org",
                "description": null,
                "animal_type": "Small & Furry"
            }
        },
        {
            "id": "2019-02-27 05:51:21 +0000",
            "type": "pet",
            "attributes": {
                "name": "RUBY",
                "petfinder_id": "44105073",
                "picture_url": "http://photos.petfinder.com/photos/pets/44105073/1/?bust=1551181192&width=50&-t.jpg",
                "location": "Denver, CO",
                "sex": "F",
                "contact_email": "customercare@ddfl.org",
                "description": null,
                "animal_type": "Small & Furry"
            }
        }....
```

## Prerequisites

* Ruby v. 2.4
* Rails v. 5.2
* Puma v. 3.7

## APIs Consumed (keys required) / External Services

* PetFinder

## Testing Dependencies

* Rspec-Rails
* Webmock
* VCR
* Faraday

## Additional Gems

* Fast_jsonapi
* Figaro

## Installation
Clone down this repository, change into the root directory and run `bundle`

To setup the database necessary, run the following commands:

`bundle exec rake db:create`

`bundle exec rake db:migrate`

## Running the Test Suite

Run `bundle exec rspec` to run the full test suite.

Run `bundle exec rspec <TEST FILE PATH>` to run a specific test

## How to Contribute

To contribute to this project please fork this repo and submit a pull request.

## Core Contributors

* [Amy Petrie](https://github.com/amypetrie)

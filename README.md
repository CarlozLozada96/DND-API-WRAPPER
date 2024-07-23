# API Wrapper Documentation

This documentation provides an overview of the API wrapper for accessing the D&D 5e API. The wrapper is built using Ruby on Rails and includes a request handling module, a client module for fetching various resources, and defined routes for accessing the data.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [Error Handling](#error-handling)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. **Install dependencies:**
  ```bash
    bundle install
  ```
3.**Start the Rails server:**
    ```bash
    rails server
    ```

## Configuration
The Dnd::Request module handles HTTP requests to the D&D 5e API. Ensure you have the rest-client gem installed.

## Usage

Request Module
The Dnd::Request module is responsible for making HTTP requests to the D&D 5e API and handling responses.
```ruby

require 'rest-client'

module Dnd 
  class Request
    BASE_URL = 'https://www.dnd5eapi.co/api'
    HEADERS = { accept: :json }

    def self.call(http_method, endpoint)
      response = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        headers: HEADERS
      )

      { code: response.code, status: 'Success', data: JSON.parse(response.body) }
    rescue RestClient::ExceptionWithResponse => error
      { code: error.http_code, status: error.message, data: Errors.map(error.http_code) }
    end
  end
end
```
## Client Module
The Dnd::Client module provides methods to fetch various resources from the D&D 5e API.
```ruby

module Dnd 
  class Client
    def self.home_list
      Dnd::Request.call('get', '/')
    end

    def self.scores_list
      Dnd::Request.call('get', '/ability-scores')
    end

    def self.alignments_list
      Dnd::Request.call('get', '/alignments')
    end

    def self.races_list
      Dnd::Request.call('get', '/races')
    end

    def self.classes_list
      Dnd::Request.call('get', '/classes')
    end

    def self.skills_list
      Dnd::Request.call('get', '/skills')
    end

    def self.subclasses_list
      Dnd::Request.call('get', '/subclasses')
    end
  end
end
```

## Endpoints
The following endpoints are available in the API wrapper:

|Endpoint||Description|
|/api/home||Get the home resource list|
|/api/scores|	|Get the list of ability scores|
|/api/alignments||Get the list of alignments|
|/api/skills|	|Get the list of skills|
|/api/classes|	|Get the list of classes|
|/api/races|	|Get the list of races|
|/api/subclasses|	|Get the list of subclasses|

## Routes Configuration
The routes are defined in config/routes.rb:
```ruby

Rails.application.routes.draw do
  namespace :api do 
    get '/home', to: 'home#index'
    get '/scores', to: 'scores#index'
    get '/alignments', to: 'alignments#index'
    get '/skills', to: 'skills#index'
    get '/classes', to: 'classes#index'
    get '/races', to: 'races#index'
    get '/subclasses', to: 'subclasses#index'
  end
end
```

## Error Handling
The Dnd::Request module handles errors by rescuing RestClient::ExceptionWithResponse exceptions and returning a structured error response:
```ruby 

rescue RestClient::ExceptionWithResponse => error
  { code: error.http_code, status: error.message, data: Errors.map(error.http_code) }
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
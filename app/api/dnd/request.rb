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

      { code: response.code, status: 'Success', data: JSON.parse(response.body)}
    rescue RestClient::ExceptionWithResponse => error
      { code: error.http_code, status: error.message, data: Errors.map(error.http_code)}
    end
  end
end
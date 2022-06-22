require "cdds/version"

module CDDS
  require 'rubygems'
  require 'time'
  require 'rest-client'
  require 'base64'

  class DataError < StandardError; end
  class AuthError < StandardError; end
  class DisqualifiedPersons
    API_VERSION="v2"
    def self.search(search_term, page_size)
      page_size = 50 if page_size.blank?
      response = RestClient.get("https://api.business.govt.nz/services/#{API_VERSION}/companies-office/disqualified-directors/search?name=#{search_term}&page-size=#{page_size}",
                                { authorization: "Bearer #{access_token}", accept: 'application/json' })
      begin
        JSON.parse(response.body).with_indifferent_access
      rescue JSON::ParserError
        raise CDDS::DataError, "CDDS API returned bad data"
      end
    end

    private

    def self.access_token
      begin
        response = RestClient.post("https://api.business.govt.nz/services/token", { grant_type: "client_credentials" },
                                   { grant_type: "client_credentials", authorization: "Basic #{Base64.strict_encode64(ENV["MBIE_ID"] + ":" + ENV["MBIE_SECRET"])}" })

        JSON.parse(response.body)["access_token"]
      rescue JSON::ParserError, NoMethodError
        raise CDDS::AuthError, "Authentication failed! Are you missing MBIE_ID or MBIE_SECRET?"
      end

    end
  end
end

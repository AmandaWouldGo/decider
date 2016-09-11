require 'dotenv'
Dotenv.load
require 'open-uri'
require 'json'
require 'httparty'
require 'awesome_print'

# helpers do
  class GooglePlaces
    include HTTParty
    base_uri 'https://maps.googleapis.com/maps/api/place'

    def initialize(params = {})
      @options = { query: params }
    end

    def nearby
      self.class.get("/nearbysearch/json", @options)
    end

    def details(place_id)
      detail_options = { query: {place_id: place_id, key: GOOGLE_PLACES_API_KEY} }
      self.class.get("/details/json", detail_options)
    end
  end

  # parse google places object
  # params: response, min_places, min_rating
  def parse_nearby(response)
    min_rating = 3
    # min_places = 1 if !params[:min_places]

    places = response["results"]

    places.select { |place| place["rating"] > min_rating if place["rating"]}
  end

  def sample_place(place_ary)
    place_ary.delete_at(rand(place_ary.length))
  end

    #   if places.length < min_places do
    #   new_query = response["next_page_token"]
    #   next_response = GooglePlaces.new({new_page_token: new_query})
    # end

# end

trial_params = {location: "-33.8670,151.1957", radius: "500", types: "food", opennow: true, key: ENV['GOOGLE_PLACES_API_KEY']}
trial = GooglePlaces.new(trial_params)
results = trial.nearby

ap parse_nearby(results)



module Api
  class PlacesController < ApplicationController

    def index
      matching_places = get_matching_places(params["search_term"])
      places = matching_places.map do |place|
        {
          name: place.name,
          city: place.city,
          most_recent_avg_download_speed: most_recent_avg_download_speed(place),
          most_recent_download_speed_units: most_recent_download_speed_units(place),
          number_of_measurements: number_of_measurements(place)
        }
      end
    
      render(json: { places: places })
    end
    

   def most_recent_avg_download_speed(place)
    place.internet_speeds.order("created_at").last&.download_speed
    end

   def most_recent_download_speed_units(place)
    place.internet_speeds.order("created_at").last&.download_units
    end

   def number_of_measurements(place)
    place.internet_speeds.count
    end

    def get_matching_places(search_term)
      if search_term.blank?
        Place.all
      else
        Place.where("name ILIKE :search_term OR city LIKE :search_term", search_term: "%#{search_term}%")
      end
    end

  end
end
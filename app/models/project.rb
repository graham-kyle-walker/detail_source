require "open-uri"
class Project < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :project_manager,
             class_name: "User"

  has_many   :designers,
             dependent: :destroy

  has_many   :details,
             dependent: :destroy

  # Indirect associations

  has_many   :suppliers,
             through: :details,
             source: :suppliers

  # Validations

  # Scopes

  def to_s
    project_manager.to_s
  end
end

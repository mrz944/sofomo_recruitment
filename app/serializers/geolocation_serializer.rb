class GeolocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :ip, :latitude, :longitude
end

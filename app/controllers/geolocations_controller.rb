class GeolocationsController < ApplicationController
  before_action :set_geolocation, only: [:show, :destroy]

  # GET /geolocations/:name
  def show
    render json: GeolocationSerializer.new(@geolocation)
  end

  # POST /geolocations
  def create
    geo_params = IPStack::Client.new.by_name(geolocation_params[:name])
    name = geo_params[:name] || geo_params[:ip]
    @geolocation = Geolocation.find_or_initialize_by(name: name)
    @geolocation.assign_attributes(geo_params)

    if @geolocation.save
      render json: GeolocationSerializer.new(@geolocation),
             status: :created, location: @geolocation
    else
      render json: @geolocation.errors, status: :unprocessable_entity
    end
  rescue Timeout::Error, Errno::ECONNRESET, Errno::ECONNREFUSED
    head :request_timeout
  end

  # DELETE /geolocations/:name
  def destroy
    @geolocation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_geolocation
    @geolocation = Geolocation.find_by_name(params[:name])
  end

  # Only allow a trusted parameter "white list" through.
  def geolocation_params
    params.require(:geolocation).permit(:name)
  end
end

require 'test_helper'

class GeolocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geolocation = geolocations(:one)
  end

  test "should create geolocation by ipv4" do
    assert_difference('Geolocation.count') do
      post geolocations_url, params: { geolocation: { name: '1.1.1.1' } }, as: :json
    end

    assert_response 201
  end

  test "should create geolocation by ipv6" do
    assert_difference('Geolocation.count') do
      post geolocations_url, params: { geolocation: { name: '2001:4860:4860::8888' } }, as: :json
    end

    assert_response 201
  end

  test "should create geolocation by hostname" do
    assert_difference('Geolocation.count') do
      post geolocations_url, params: { geolocation: { name: 'google.com' } }, as: :json
    end

    assert_response 201
  end

  test "should update existing geolocation" do
    assert_no_difference('Geolocation.count') do
      post geolocations_url, params: { geolocation: { name: @geolocation.name } }, as: :json
    end

    assert_response 201
  end

  test "should show geolocation" do
    get geolocation_url(@geolocation.name), as: :json
    assert_response :success
  end

  test "should destroy geolocation" do
    assert_difference('Geolocation.count', -1) do
      delete geolocation_url(@geolocation.name), as: :json
    end

    assert_response 204
  end
end

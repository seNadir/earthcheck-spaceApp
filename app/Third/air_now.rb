class AirNow
  include HTTParty
  base_uri 'http://www.airnowapi.org/aq/forecast/latLong'
  @options = { query: { API_KEY: '7E9A4F07-964F-49DE-B6CF-C430EE7202D2', format: 'application/json'} }

  def self.get_by_geo geo
    date = new DateTime.now
    get("/?latitude=#{geo[0]}&longitude=#{geo[1]}&date=&distance=25", @options).parsed_response
    ?=39.0509&=-121.4453&date=2016-04-22&distance=25
  end
end
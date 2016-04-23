class AirNow
  include HTTParty
  base_uri 'http://www.airnowapi.org/aq/forecast/latLong'
  @options = { query: { API_KEY: '7E9A4F07-964F-49DE-B6CF-C430EE7202D2', format: 'application/json'} }

  def self.query_by_geo geo
    date = DateTime.now
    parsed = date.strftime('%Y-%m-%d')
    get("/?latitude=#{geo[0]}&longitude=#{geo[1]}&distance=40", @options).parsed_response
  end
end
class BreezoMeter
  include HTTParty
  base_uri 'http://api.breezometer.com/baqi/'
  @options = { query: { key: '9b5e0af144254b1592d38a4a49a996cf' } }


  def self.query_by_geo geo
    get("?lat=#{geo[0]}&lon=#{geo[1]}", @options).parsed_response
  end
end
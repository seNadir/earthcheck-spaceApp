class Weather
  include HTTParty
  base_uri 'http://api.openweathermap.org'
  @options = { query: { apikey: 'd97ad90fe1a4c66d1ae81056f50bd507' } }


  def self.query_by_city city
    get("/data/2.5/weather?q=#{city}", @options).parsed_response
  end

  def self.query_by_geo geo
    get("/data/2.5/weather?lat=#{geo[0]}&lon=#{geo[1]}", @options).parsed_response
  end

  def self.query_by_zip(zip, zip_c)
    get("/data/2.5/weather?zip=#{zip},#{zip_c}", @options).parsed_response
  end
end
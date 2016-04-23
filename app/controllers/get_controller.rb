class GetController < ApplicationController


  def get_weather
    render text: 'error' and return unless params[:lat].present? and params[:long].present?
    data = Weather.query_by_geo [params[:lat], params[:long]]
    data2 = BreezoMeter.query_by_geo [params[:lat], params[:long]]

    obj = { temp: { main: data['main'], wind: data['wind'], name: data['name'] }}
    if data2['data_valid']
      #data2 = data2[0] if data2.respond_to? :each
      data2.delete_if {|key, value| not %w(breezometer_aqi breezometer_description random_recommendations).include?(key) }
      obj[:air] = data2
    end
    render json: obj
  end
end
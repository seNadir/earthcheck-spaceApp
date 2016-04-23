class GetController < ApplicationController


  def get_weather
    render text: 'error' and return unless params[:lat].present? and params[:long].present?
    data = Weather.query_by_geo [params[:lat], params[:long]]
    data2 = AirNow.query_by_geo [params[:lat], params[:long]]

    obj = { temp: { main: data['main'], wind: data['wind'], name: data['name'] }}
    if data.nil?
    else
      data2 = data2[0] if data2.respond_to? :each
      obj[:air] = data2
    end
    render json: obj
  end
end
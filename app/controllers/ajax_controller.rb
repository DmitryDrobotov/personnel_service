class AjaxController < ApplicationController
  
  require 'net/http'
  require 'uri'
  require 'base64'

  def positions_in_department
    department_id = params[:department_id]
    if department_id.present?
      @positions = Position.where(:department_id => department_id).all
    else
      @positions = []
    end
    select_options = @positions.collect { |position| "<option value=#{position.id}>#{position.name}</option>" }
    render :text => "#{select_options.join("")}"
  end

  def external_url_data
    encoded_url = params[:url]
    url = Base64.decode64(encoded_url)
    p "\nFetching data from " + url
    url = URI(url)
    render :text => Net::HTTP.get(url)
  end

end

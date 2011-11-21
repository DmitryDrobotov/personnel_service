class AjaxController < ApplicationController

  JAVA_URL = "http://192.168.43.216:8080/PersonnelService/graphs.do"
  TIMEOUT = 20

  require 'open-uri'
  require 'timeout'  

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


  def java_url_data
    url = JAVA_URL + "?" + params.to_query
    p ""
    p "Fetching data from " + url
    begin
      Timeout::timeout(TIMEOUT) do
        @data = open(url).read
        p "Done!"
      end
      rescue 
        @data = ""
        p "Failed..."
    end
    render :text => @data
  end

end

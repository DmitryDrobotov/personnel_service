class AjaxController < ApplicationController
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

end

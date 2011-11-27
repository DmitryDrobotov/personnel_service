class TreatmentsController < ApplicationController

  authorize_resource

  def index
    @treatments = Treatment.where(:user_to_id => current_user.id).all
  end

  def show
    @treatment = Treatment.find(params[:id])
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(params[:treatment])
    @treatment.user_from = current_user
    if @treatment.save
      redirect_to @treatment, :notice => "Successfully created treatment."
    else
      render :action => 'new'
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def update
    @treatment = Treatment.find(params[:id])
    if @treatment.update_attributes(params[:treatment])
      redirect_to @treatment, :notice => "Successfully updated treatment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    redirect_to treatments_url, :notice => "Successfully destroyed treatment."
  end
end

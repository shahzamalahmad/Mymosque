class CreditsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @credits = Credit.all
  end


  def show
    @home = Home.find(params[:id])
    @credit = Credit.find_by(id: params[:id])
  end
end

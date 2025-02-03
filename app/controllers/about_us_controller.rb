class AboutUsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @about_us = AboutUs.all
  end


  def show
    @about_us = AboutUs.find_by(id: params[:id])
  end
end

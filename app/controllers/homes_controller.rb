class HomesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    filter = params[:filter]

    mosques = Home.where(is_approved: true)
    @mosques = if params[:search].present?
                 mosques.where('title LIKE ?', "%#{params[:search]}%")
               elsif filter.present?
                 mosques.where(category: filter)
               else
                 mosques.all
               end
    @mosque_index = mosques.where(category: "mosque")
    @madarsa_index = mosques.where(category: "madarsa")
    # if @mosques.present?
    #   render json: { data: @mosques }, status: :ok
    # else
    #   render json: { message: 'not found' }, status: :not_found
    # end
    respond_to do |format|
      format.html # Render HTML for normal requests
      format.json { render json: { data: @mosques }, status: :ok } # Render JSON for JSON requests
    end
  end


  def show
    # @location = Location.find(params[:id])
    @home = Home.find(params[:id])
    @location = Location.find_or_create_by(latitude: @home.latitude, longitude: @home.longitude)
    # byebug
    # render json: {data: @home},  status: :created
  end
  
  def new
    @mosque = Home.new(home_params)

    # @categories = Category.all
  end

  def create
    mosque = Home.new(home_params )
    if mosque.save
      render json: {data: mosque,message:'mosque created successfully'}, status: :created
    else
      render json: {message:'not created'}, status: :false
    end
  end

  def update
    mosque = Home.new(home_params )
    if mosque.save
      render json: {data: mosque,message:'mosque updated successfully'}, status: :created
    else
      render json: {message:'mosque not found'}, status: :false
    end
  end

  def destroy
    # binding.pry
    home = Home.find(params[:id])
    if home.destroy
      render json: {data: home, message:'mosque deleted successfully'}
    else
      render json: {message:'mosque not found'}, status: :unprocessible_entity
    end
  end

  private

  def home_params
    params.require(:home).permit(:category, :address, :manager, :contact_no, :imam, :category, :whatsapp, :email)
  end
end

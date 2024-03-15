class HomesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    filter = params[:filter]


    @mosques = if params[:search].present?
                 Home.where('title LIKE ?', "%#{params[:search]}%")
               elsif filter.present?
                 Home.where(category: filter)
               else
                 Home.all
               end
    @mosque_index = Home.where(category: "mosque")
    @madarsa_index = Home.where(category: "madarsa")
    # if @mosques.present?
    #   render json: { data: @mosques }, status: :ok
    # else
    #   render json: { message: 'not found' }, status: :not_found
    # end
  end


  def show
    @home = Home.find(params[:id])
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

class SearchController < ApplicationController
  def search
    @results = []
    if params[:q].present?
      @results += Home.where('full_name LIKE ?', "%#{params[:q]}%")
      @results += Home.where('address LIKE ?', "%#{params[:q]}%")
      # @results += AdminUser.where('username LIKE ?', "%#{params[:q]}%")
      
    end
    @results.uniq! # Remove duplicate entries
  end
end
class TermsAndConditionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @terms_and_conditions = TermAndCondition.all
  end

  def show
    @term_and_condition = TermAndCondition.find_by(id: params[:id])
  end
end

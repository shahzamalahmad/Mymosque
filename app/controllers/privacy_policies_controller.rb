class PrivacyPoliciesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @privacy_policies = PrivacyPolicy.all
  end


  def show
    @privacy_policy = PrivacyPolicy.find_by(id: params[:id])
  end
end

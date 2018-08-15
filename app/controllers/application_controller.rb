class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # including pundit being used in out app
  include Pundit
  # adding the whitelist approach to pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  private
  # allowing for a way to skip pundit
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

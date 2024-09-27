class ApplicationController < ActionController::Base
  before_action :authorize_receptionist, only: [ :create, :update, :destroy ]

  private

  def authorize_receptionist
    unless current_user.role_code == "RECEPTIONIST"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

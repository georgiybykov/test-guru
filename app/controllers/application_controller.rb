class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(user)
    current_user.admin? ? admin_tests_path : stored_location_for(:user) || root_path
  end

  # def after_sign_in_path_for(user)
  #   current_user.admin? ? admin_tests_path : super
  # end
end

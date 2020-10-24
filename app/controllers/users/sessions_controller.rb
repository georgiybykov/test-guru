# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super

    flash[:notice] = t('.hello', greeting: name_or_email)
  end

  private

  def name_or_email
    current_user.first_name || current_user.email
  end
end

# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %( 'Admin TestGuru' <dev.projects@mail.ru> )
  layout 'mailer'
end

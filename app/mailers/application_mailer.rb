# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %( 'Admin TestGuru' <dev.prjcts@gmail.com> )
  layout 'mailer'
end

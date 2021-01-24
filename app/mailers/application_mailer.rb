# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %( 'Admin TestGuru' <test.guru.devproject@gmail.com> )

  layout 'mailer'
end

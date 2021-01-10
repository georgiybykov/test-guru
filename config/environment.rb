# Load the Rails application.
require_relative 'application'

# Load the CarrierWave after loading the ORM.
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

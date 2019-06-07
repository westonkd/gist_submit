class Platform < ApplicationRecord
  validates :public_key_uri, :authorization_uri, :iss, presence: true
  validates :public_key_uri, :authorization_uri, format: URI::regexp(%w[http https])

  has_many :client_credentials
end

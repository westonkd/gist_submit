class ClientCredential < ApplicationRecord
  validates :client_id, :client_secret, presence: true

  belongs_to :platforms
end

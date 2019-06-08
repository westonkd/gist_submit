class ClientCredential < ApplicationRecord
  before_validation :infer_defaults

  validates :client_id, presence: true

  belongs_to :platform

  private

  def infer_defaults
    # TODO: read form correct env
    self.private_jwk ||= Rails.application.credentials.developement.dig(:key_pair, :private_key)
  end
end

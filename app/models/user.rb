class User < ApplicationRecord
  validates  :username, :avatar_url, :email, :uid, :provider, :oauth_token, presence: true

  has_many :assignments
  has_many :courses

  TEACHER_ROLE = "http://purl.imsglobal.org/vocab/lis/v2/institution/person#Instructor".freeze

  def self.by_lti_id(lti_id)
    find_by!(lti_id: lti_id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end

class User < ActiveRecord::Base

  has_secure_password

  before_create :set_auth_token

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generated_auth_token
    end

    def generated_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end

end

class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :websites, through: :blogs, dependent: :destroy
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: [:github, :google_oauth2, :facebook]
  
  
  
    # def self.find_for_database_authentication(warden_conditions)
    #   conditions = warden_conditions.dup
    #   if (login = conditions.delete(:login))
    #     where(conditions.to_h).where(["lower(username) = :value OR lower(email)= :value OR (mobile)= :value", { :value => login.downcase }]).first
    #   elsif conditions.has_key?(:mobile) || conditions.has_key?(:email) || conditions.has_key?(:username)
    #     where(conditions.to_h).first
    #   end
    # end

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      unless user
          user = User.create(
            email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.provider = auth.provider
  #   user.uid = auth.uid
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  # end
  # end
end

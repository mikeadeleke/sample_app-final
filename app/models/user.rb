# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
	attr_accessor :password
	def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true
    validates :password, presence: true,
    										 confirmation: true
  end
end

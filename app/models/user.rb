# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	def user_params
    params.require(:user).permit(:name, :email)
    validates :name, presence: true
    								 length: { maximum: 50 }
    validates :email, presence: true
    									uniqueness: { case_sensitive: false }

  end
end

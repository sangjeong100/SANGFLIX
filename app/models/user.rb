class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movie_queues, dependent: :destroy
  has_many :orders, dependent: :destroy

  ACCOUNT_TYPE = ['무제한 이용권', '월 2회 이용권']

  PARAMETERS = %i(name email last_name first_name age account_type account_number total_monthly_order plan_date address detailed_address zipcode telphone)
end

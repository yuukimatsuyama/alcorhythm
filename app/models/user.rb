class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  has_many :schedules
 
  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX},on: :create,uniqueness: true
    with_options numericality: { other_than:0,message: 'を選択してください'} do
      validates :sex_id
    end
     VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
     validates :password,on: :create,length:{minimum:8}, format: { with: VALID_PASSWORD_REGEX ,message:'は半角英数字のみです。'}, confirmation: { type: :password, message: "がパスワードと一致していません。" }
  end

end

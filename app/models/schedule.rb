class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :alcohol
  belongs_to :user
 
  with_options presence: true do
    validates :start_time, uniqueness: { scope: :user }
    with_options numericality: { other_than:0,message: 'を選択してください'} do
      validates :alcohol_id
    end
    validates :percentage, numericality:{ greater_than: 0, less_than_or_equal_to: 100 },format: { with: /\A[0-9]+\z/ }
    validates :amount, numericality: { greater_than: 0, less_than_or_equal_to: 99_999 },format: { with: /\A[0-9]+\z/ }
  end

end

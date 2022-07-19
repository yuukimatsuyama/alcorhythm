class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :alcohol
  belongs_to :user
 
  with_options presence: true do
    validates :start_time, uniqueness: true
    with_options numericality: { other_than:0,message: 'を選択してください'} do
      validates :alcohol_id
    end
    validates :percentage, numericality:{ greater_than: 0, less_than_or_equal_to: 100 },
    format: { with: /\A[0-9]+\z/ }
    validates :amount, numericality: { greater_than: 0, less_than_or_equal_to: 99_999 },
    format: { with: /\A[0-9]+\z/ }
    validates :user_id
  end

  def schedule_count
    to = Time.current
    from = (to - 1.week)
    @schedules = Schedule.where(start_time: from...to).count
  end

end

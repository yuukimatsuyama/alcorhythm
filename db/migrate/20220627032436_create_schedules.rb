class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|

      t.integer     :alcohol_id,     null: false 
      t.integer     :percentage,     null: false 
      t.integer     :amount,         null: false 
      t.datetime    :start_time,     null: false 
      t.references  :user,           null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

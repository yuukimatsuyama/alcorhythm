require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end
    describe 'データ保存' do
      context 'データが保存できる' do
        it '各カラムが正常に入力されれば、データが保存できる' do
          expect(@schedule).to be_valid
        end
        it '異なるユーザーが同じ日時に登録してもデータは保存できる' do
          @schedule.save
          another_user = FactoryBot.build(:schedule)
          another_user.start_time = @schedule.start_time
          expect(@schedule).to be_valid
        end
      end
      context 'データが保存できない' do
        it '同一ユーザーで同じ日に重複したデータは保存できない' do
          @schedule.save
          schedule = Schedule.create
          schedule.start_time = "2022-7-20"
          schedule.valid?
          expect(schedule.errors.full_messages).to include("")
        end
        it 'alcohol_idが0では登録できない' do
          @schedule.alcohol_id = 0
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の種類を選択してください")
        end
        it 'percentageが空では登録できない' do
          @schedule.percentage = ''
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("度数を入力してください")
        end
        it 'percentageは0より大きい数字でないと登録できない' do
          @schedule.percentage = 0
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("度数は0より大きい値にしてください")
        end
        it 'percentageは100より大きい数字は登録できない' do
          @schedule.percentage = 180
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("度数は100以下の値にしてください")
        end
        it 'percentageは半角数字でなければ登録できない' do
          @schedule.percentage = '６'
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("度数は数値で入力してください")
        end
        it 'amountは0より大きい数字でなければ登録できない' do
          @schedule.amount = 0
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の量は0より大きい値にしてください")
        end
        it 'amountは99999より大きい数字は登録できない' do
          @schedule.amount = 100000000
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の量は99999以下の値にしてください")
        end
        it 'amountは半角数字でなければ登録できない' do
          @schedule.amount = '９００'
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の量は数値で入力してください")
        end
        it 'amountは数字でなければならない' do
          @schedule.amount = '十'
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の量は数値で入力してください")
        end
        it 'amountが空では登録できない' do
          @schedule.amount = ''
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("お酒の量を入力してください", "お酒の量は数値で入力してください", "お酒の量は不正な値です")
        end
        it 'userが紐づいてなければ出品できない' do
          @schedule.user = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("Userを入力してください")
        end
      end
    end
end


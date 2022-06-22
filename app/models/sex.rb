class Sex < ActiveHash::Base
  self.data = [
    { id: 0, name: '性別を選択してください' },
    { id: 1, name: '男性' },
    { id: 2, name: '女性' },
    { id: 3, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :users
end
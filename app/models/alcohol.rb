class Alcohol < ActiveHash::Base
  include ActiveHash::Associations
  
  self.data = [
    {id: 1, name: 'ビール'},
    {id: 2, name: '日本酒'},
    {id: 3, name: '焼酎'},
    {id: 4, name: 'ワイン'},
    {id: 5, name: 'ウイスキー'},
    {id: 6, name: 'カクテル'},
    {id: 7, name: '酎ハイ'},
    {id: 8, name: 'カクテル'},
  ]
end
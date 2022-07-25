FactoryBot.define do
  factory :schedule do
    alcohol_id         {2}
    percentage         {5}
    amount             {500}
    start_time         {"2022-7-20"}
    user_id            {1}
    association :user
  end
end

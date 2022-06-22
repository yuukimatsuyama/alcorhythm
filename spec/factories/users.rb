FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.com'}
    password              {'aaaa1111'}
    password_confirmation {password}
    sex_id                {1}
  end
end
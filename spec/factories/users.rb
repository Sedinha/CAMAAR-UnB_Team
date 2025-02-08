FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:matricula) { |n| "#{n}123456" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    role { "user" }

    trait :admin do
      sequence(:email) { |n| "admin#{n}@prof.br" }
      role { "admin" }
    end
  end
end
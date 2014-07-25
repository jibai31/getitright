# More info:
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  provider: 'twitter',
  uid: '12345',
  info: { name: 'John Doe', image: '' },
  credentials: { token: "abc_def", secret: "123_456" }
})

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: '12345',
  info: { email: 'john.doe@example.com', name: 'John Doe', image: '' },
  credentials: { token: "abc_def", secret: "123_456" }
})

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '12345',
  info: { email: 'john.doe@example.com', name: 'John Doe', image: '' },
  credentials: { token: "abc_def", secret: "123_456" }
})

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    name      "John Doe"
    password  "password"

    factory :user_with_authentication do
      ignore do
        provider "twitter"
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create(:authentication, user: user, provider: evaluator.provider)
      end
    end
  end

  factory :authentication do
    provider "provider"
    uid "12345"
    user
  end

  factory :task_definition do
    sequence(:text) { |n| "task-#{n}" }
    sequence(:step) { |n| n }
  end

  factory :check_list_definition do
    sequence(:name) { |n| "List-#{n}" }
    user

    after(:create) do |check_list_definition|
      check_list_definition.task_definitions << create_list(:task_definition, 5)
    end
  end

  factory :check_list do
    sequence(:name) { |n| "List-execution-#{n}" }
    user
    status "started"
  end

end

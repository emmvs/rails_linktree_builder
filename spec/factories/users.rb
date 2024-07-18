FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }  # Generates a unique email
    password { 'password' }          # A default password
    reset_password_token { nil }     # Not needed for most tests
    reset_password_sent_at { nil }   # Not needed for most tests
    remember_created_at { nil }      # Not needed for most tests

    # Optional attributes
    username { Faker::Internet.username(specifier: 5..8) } # Generates a unique username
    full_name { Faker::Name.name }  # Generates a full name
    body { Faker::Lorem.sentence }  # Generates a random sentence
    slug { username.downcase }      # Uses the generated username as slug
    admin { false }                 # Default to non-admin
  end
end

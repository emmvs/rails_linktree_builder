FactoryBot.define do
  factory :link do
    title { 'Read our newsletter! 🗞️' }
    url { 'http://example.com' }
    user
    click_count { 0 }
    last_clicked_at { nil }
    user_agent { 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }
    device_type { 'desktop' }
    country { 'USA' }
    city { 'New York' }
  end
end

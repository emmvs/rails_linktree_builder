# frozen_string_literal: true

if Rails.env.development?
  puts 'Cleaning Database 🧼'
  Click.destroy_all
  Link.destroy_all
  User.destroy_all
end

puts 'Creating Users 👩🏼‍💻👨🏽‍💻'
emma = User.create!(
  email: 'emma@test.com',
  password: '123456',
  username: 'emmas_linktree',
  full_name: 'Emmas Amazing LinkTree',
  body: 'Be pretty amazing!',
  admin: true
)

emmas_avatar = URI.open('https://res.cloudinary.com/dk5glvhr6/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1702417330/production/f5vx3ewbh8ago36btki3bozapaxw.jpg?_s=public-apps')
emma.avatar.attach(io: emmas_avatar, filename: 'avatar.jpg')

hivetracks = User.create!(
  email: 'info@hivetracks.com',
  password: '123456',
  username: 'hivetracks',
  full_name: 'The Official HiveTracks LinkTree',
  body: 'Know your bees.',
  admin: true
)

hivetracks_avatar = URI.open('https://res.cloudinary.com/dk5glvhr6/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1702417330/production/f5vx3ewbh8ago36btki3bozapaxw.jpg?_s=public-apps')
hivetracks.avatar.attach(io: hivetracks_avatar, filename: 'avatar.jpg')

puts 'Creating Links 🔗🔗🔗'
Link.create!(
  title: 'Learn to code!👩🏼‍💻',
  url: 'http://www.lewagon.com',
  user: emma
)

le_wagon = Link.create!(
  title: 'Check out my website!💻',
  url: 'https://www.emmaruenzel.com/',
  user: emma
)

app = Link.create!(
  title: 'Download The HiveTracks App! 📱',
  url: 'https://hivetracks-mountain.vercel.app/Home',
  user: hivetracks
)

website = Link.create!(
  title: 'Visit our Website! 🐝',
  url: 'https://www.hivetracks.com/',
  user: hivetracks
)

love_letter = Link.create!(
  title: 'Send us a Love Letter 💌',
  url: 'mailto:info@hivetracks.com',
  user: hivetracks
)

puts 'Creating Clicks 🐁'
Click.create!(link: le_wagon, user_agent: 'Mozilla/5.0', device_type: 'Mobile', country: 'Israel', city: 'Tel Aviv',
              clicked_at: Time.current)
Click.create!(link: app, user_agent: 'Mozilla/5.0', device_type: 'Desktop', country: 'USA', city: 'New York',
              clicked_at: Time.current)
Click.create!(link: website, user_agent: 'Mozilla/5.0', device_type: 'Mobile', country: 'Germany', city: 'Berlin',
              clicked_at: Time.current)
Click.create!(link: love_letter, user_agent: 'Mozilla/5.0', device_type: 'Mobile', country: 'Sweden', city: 'Växjö',
              clicked_at: Time.current)

puts 'Done ✅'

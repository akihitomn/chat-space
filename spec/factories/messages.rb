FactoryGirl.define do

  factory :message do
    message     "test"
    group_id    "1"
    user_id     "1"
    image { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/sample.jpeg'), 'sample/jpeg'}
    created_at       { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at       { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
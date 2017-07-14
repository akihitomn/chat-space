FactoryGirl.define do

  factory :message do
    message     "test"
    group_id    "2"
    user_id     "1"
    image { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/sample.jpeg'), 'sample/jpeg'}
  end

end
require 'rails_helper'

describe Message  do
  describe '#create' do
    it "is valid with a message and image?" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid without a image?" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is valid without a message?" do
      message = build(:message, message: "")
      expect(message).to be_valid
    end

    it "is invalid without both message and image?" do
      message = build(:message, message: "", image: "")
      message.valid?
      expect(message.errors[:message_or_image]).to include("を入力してください")
    end

    it "is invalid without a group_id?" do
      expect{create(:message, group_id: "")}.to raise_error (ActiveRecord::NotNullViolation)
    end

    it "is invalid without a user_id?" do
      expect{create(:message, user_id: "")}.to raise_error (ActiveRecord::NotNullViolation)
    end

  end
end

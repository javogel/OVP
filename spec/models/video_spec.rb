require 'rails_helper'

RSpec.describe Video, type: :model do


  context "for creating a new video" do
    before(:each) do
      @new_vid = Video.create(youtube_id: "oY59wZdCDo0", user_id: 1)
    end

     it "it requires user_id" do
       Video.create(youtube_id: "j2oXFWKpJiA").should_not be_valid
     end

     it "it requires youtube_id" do
       Video.create(user_id: 1).should_not be_valid
     end

     it "it does not duplicate video" do
       Video.create(youtube_id: "oY59wZdCDo0").should_not be_valid
     end

     it "it checks for valid youtube_id" do
       expect(Video.create_video("aaaaaaa", 1).is_a? String).to eq(true)
       expect(Video.create_video("oY59wZdCDo000", 1).is_a? String).to eq(true)
     end

  end
end

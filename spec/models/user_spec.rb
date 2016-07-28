require 'rails_helper'

RSpec.describe User, type: :model do


  context "for creating a new user" do
    before(:each) do
      first_user = User.create(first_name: "Johannus", last_name: "Vogel", email: "test@gmail.com")
    end

     it "it requires name and last name" do
        User.create(email: "johannus.vogel@gmail.com").should_not be_valid
     end

     it "it requires email" do
       Video.create(first_name: "Johannus", last_name: "Vogel").should_not be_valid
     end

     it "it does not duplicate user" do
       Video.create(first_name: "Sameas", last_name: "Firstuser" email: "test@gmail.com").should_not be_valid
     end

    #  it "it checks for valid youtube_id" do
    #    expect(Video.create_video("aaaaaaa", 1).is_a? String).to eq(true)
    #    expect(Video.create_video("oY59wZdCDo000", 1).is_a? String).to eq(true)
    #  end

  end


  context "user methods" do
      before(:each) do
        first_user = User.create(email: "test@gmail.com")
        first_category = Category(name: "category1")

      end
      it "user starts with no categories" do

        user.should have(0).categories
      end
     it "adds cateogry to user" do
       user.add_category(1)

       user.should have(1).categories
     end

  end





end

require 'spec_helper'

describe User do

  describe "#to_s" do
    it "prints the user's name" do
      user = build(:user, name: 'James')
      user.to_s.should == 'James'
    end

    context "when name empty" do
      it "prints the name part of the user's email" do
        user = build(:user, name: '', email: 'james@example.com')
        user.to_s.should == 'james'
      end
    end

    context "when name and email empty" do
      it "prints the user id" do
        user = build(:user, name: '', email: '', id: 4)
        user.to_s.should == 'user4'
      end
    end
  end
end

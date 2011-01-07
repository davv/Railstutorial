require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :mail => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an mail address" do
    no_mail_user = User.new(@attr.merge(:mail => ""))
    no_mail_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid mail addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_mail_user = User.new(@attr.merge(:mail => address))
      valid_mail_user.should be_valid
    end
  end

  it "should reject invalid mail addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_mail_user = User.new(@attr.merge(:mail => address))
      invalid_mail_user.should_not be_valid
    end
  end
  
  it "should reject duplicate mail addresses" do
    # Put a user with given mail address into the database.
    User.create!(@attr)
    user_with_duplicate_mail = User.new(@attr)
    user_with_duplicate_mail.should_not be_valid
  end
  
  it "should reject mail addresses identical up to case" do
    upcased_mail = @attr[:mail].upcase
    User.create!(@attr.merge(:mail => upcased_mail))
    user_with_duplicate_mail = User.new(@attr)
    user_with_duplicate_mail.should_not be_valid
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    describe "authenticate method" do

      it "should return nil on mail/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:mail], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an mail address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on mail/password match" do
        matching_user = User.authenticate(@attr[:mail], @attr[:password])
        matching_user.should == @user
      end
    end
  end
end


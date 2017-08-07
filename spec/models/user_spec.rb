require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before :each do
      @user = User.create(
        name: 'Jack Sparrow',
        email: 'jSparrow@example.com',
        password: 'jSparrow',
        password_confirmation: 'jSparrow')
    end

    context 'Password:' do
      it "Should match password confirmation" do
        expect(@user.password_digest.present?).to eq(true)
      end

      it "Should log an error if password is blank" do
        @user = User.create(
          name: 'Jack Sparrow',
          email: 'jSparrow@example.com',
          password: '',
          password_confirmation: 'jSparrow')

        expect(@user.errors.full_messages.present?).to eq(true)
      end

      it "Should log an error if confirm password is blank" do
        @user = User.create(
          name: 'Jack Sparrow',
          email: 'jSparrow@example.com',
          password: 'jSparrow',
          password_confirmation: '')

        expect(@user.errors.full_messages.present?).to eq(true)
      end

      it "Should log an error if password does not match confirm password" do
        @user = User.create(
          name: 'Jack Sparrow',
          email: 'jSparrow@example.com',
          password: 'jSparrow',
          password_confirmation: 'JsPARROW')

        expect(@user.errors.full_messages.present?).to eq(true)
      end

      it "Should log an error if password is short (less than 4)" do
        @user = User.create(
          name: 'Jack Sparrow',
          email: 'jSparrow@example.com',
          password: '123',
          password_confirmation: '123')

        expect(@user.errors.full_messages.present?).to eq(true)
      end
    end

    context 'Email:' do
      it "Should log an error if email is blank" do
        @user = User.create(
          name: 'Jack Sparrow',
          password: '123',
          password_confirmation: '123')

        expect(@user.errors.full_messages.present?).to eq(true)
      end
      it "Should log an error if email already exists" do
        @user = User.create(
          name: 'Jack Sparrow',
          email: 'test@test.COM',
          password: '1234',
          password_confirmation: '1234')
        @user1 = User.create(
          name: 'Jack Sparrow2',
          email: 'TEST@TEST.com',
          password: '1234',
          password_confirmation: '1234')

        expect(@user1.valid?).to eq(false)
        expect(@user1.errors.full_messages.present?).to eq(true)
      end
    end

    context 'Name:' do
      it "Should log an error when user name is blank" do
        @user = User.create(
          name: nil,
          email: 'test@test.COM',
          password: '1234',
          password_confirmation: '1234')
        expect(@user.errors.full_messages.present?).to eq(true)
      end
    end
  end

  describe '.authenticate_with_credentials:' do
    it 'User should log in with the correct password' do
      @user = User.create(
        name: 'Eddie Vedder',
        email: 'eVedder@test.com',
        password: '1234',
        password_confirmation: '1234')
      expect(@user.authenticate_with_credentials('eVedder@test.com', '1234').present?).to eq(true)
    end

    it 'User should not log in with an incorrect password' do
      @user = User.create(
        name: 'Eddie Vedder 1',
        email: 'eVedder1@test.com',
        password: '1234',
        password_confirmation: '1234')
      expect(@user.authenticate_with_credentials('eVedder1@test.com', '12345').present?).to eq(false)
    end

    it 'User should log in with spaces before email' do
      @user = User.create(
        name: 'Eddie Vedder 2',
        email: 'eVedder2@test.com',
        password: '1234',
        password_confirmation: '1234')
      expect(@user.authenticate_with_credentials(' eVedder2@test.com', '1234').present?).to eq(true)
    end

    it 'User should log in with spaces after email' do
      @user = User.create(
        name: 'Eddie Vedder 3',
        email: 'eVedder3@test.com',
        password: '1234',
        password_confirmation: '1234')
      expect(@user.authenticate_with_credentials('eVedder3@test.com ', '1234').present?).to eq(true)
    end

    it 'User should log in even if email is in different case' do
      @user = User.create(
        name: 'Eddie Vedder 4',
        email: 'eVedder4@test.com',
        password: '1234',
        password_confirmation: '1234')
      expect(@user.authenticate_with_credentials('EvEDDER4@test.com ', '1234').present?).to eq(true)
    end
  end
end


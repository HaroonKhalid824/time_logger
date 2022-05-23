# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'validations' do
    before do
      @user = User.create!(name: 'HiUser', email: 'hi-user@example.com', password: 'password')
    end

    it 'should check for validations' do
      attendance = @user.attendances.new

      expect(attendance).to_not be_valid

      attendance = @user.attendances.new(time_in: Time.current)

      expect(attendance).to be_valid
    end
  end

  context 'default values' do
    before do
      @user = User.create!(name: 'HiUser', email: 'hi-user@example.com', password: 'password')
    end

    it 'should check for validations' do
      attendance = @user.attendances.create(time_in: Time.current)

      expect(attendance.status).to eq(:pending)
    end
  end

  context 'should mark it as complete when time_out is logged' do
    before do
      @user = User.create!(name: 'HiUser', email: 'hi-user@example.com', password: 'password')
    end

    it 'should check for validations' do
      attendance = @user.attendances.create(time_in: Time.current)

      expect(attendance.status).to eq(:pending)

      attendance.update!(time_out: Time.current + 2.hours)
      attendance.reload
      expect(attendance.status).to eq(:marked)
    end

    it 'should mark it complete if a record is manually created' do
      attendance = @user.attendances.create(time_in: Time.current, time_out: Time.current + 2.hours)
      expect(attendance.status).to eq(:marked)
    end
  end
end

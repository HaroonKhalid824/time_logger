# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  time_in    :datetime
#  time_out   :datetime
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Attendance < ApplicationRecord
  extend Enumerize

  enumerize :status, in: [:pending, :marked], default: :pending, predicates: true

  belongs_to :user

  validates :time_in, presence: true

  after_update :mark_status, if: ->(obj) { obj.saved_changes.include?(:time_out) || obj.saved_changes.include?(:time_in) }

  private

  def mark_status
    update(status: :marked) if time_in.present? && time_out.present?
  end
end

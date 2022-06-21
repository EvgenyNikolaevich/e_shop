# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement, dependent: :restrict_with_exception

  scope :completed, -> { where.not(completed_at: nil) }
end

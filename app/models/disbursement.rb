# frozen_string_literal: true

class Disbursement < ApplicationRecord
  belongs_to :order
end

# frozen_string_literal: true

class Merchant < ApplicationRecord
  has_many :orders, dependent: :restrict_with_exception
  has_many :shoppers, through: :orders
end

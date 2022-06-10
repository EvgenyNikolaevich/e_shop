# frozen_string_literal: true

class Merchant < ApplicationRecord
  has_many :orders
  has_many :shoppers, through: :orders
end

# frozen_string_literal: true

class Shopper < ApplicationRecord
  has_many :orders, dependent: :restrict_with_exception
  has_many :merchants, through: :orders
end

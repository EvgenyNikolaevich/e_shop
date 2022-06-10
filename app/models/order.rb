# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
end

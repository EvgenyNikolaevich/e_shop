# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    # merchant_id { create(:merchant) }
    # shopper_id { 1 }
    amount { rand(0..1_000) }
    completed_at {}
  end
end

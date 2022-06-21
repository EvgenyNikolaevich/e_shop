# frozen_string_literal: true

FactoryBot.define do
  factory :shopper do
    name { 'Jhon' }
    email { "unique#{rand(0..1_000)}@gmail.com" }
    nif { rand(0...10_000) }
  end
end

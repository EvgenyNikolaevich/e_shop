FactoryBot.define do
  factory :merchant do
    name { 'Jhon' }
    email { "unique#{rand(0..1_000)}@gmail.com" }
    cif { rand(0...10_000) }
  end
end
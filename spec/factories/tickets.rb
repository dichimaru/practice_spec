FactoryBot.define do
  factory :ticket do
    fare             { 150 }
    entered_gate_id  { create(:gate).id }
  end
end

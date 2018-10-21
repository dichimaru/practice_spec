FactoryBot.define do
  factory :gate do
    name             { Gimei.address.town }
    station_number   { (Gate.last&.station_number || 0) +1 }
  end
end

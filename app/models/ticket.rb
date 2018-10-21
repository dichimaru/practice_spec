class Ticket < ApplicationRecord
  belongs_to :entered_gate, class_name: "Gate", foreign_key: "entered_gate_id"
  belongs_to :exited_gate, class_name: "Gate", foreign_key: "exited_gate_id", required: false

  validates :fare, presence: true, inclusion: Fare::Client.new.get
  validates :entered_gate_id, presence: true
  validates :exited_gate_id,  presence: true, on: :update



  def calc?
    return false if exited_gate.blank?

    ride_num = exited_gate&.station_number.to_i - entered_gate.station_number
    return false if ride_num.to_i <= 0

    fares = Fare::Client.new.seactons
    fare >= fares[ride_num]
  end
end

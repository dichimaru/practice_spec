require "rails_helper"

RSpec.describe Ticket, type: :model do

  describe "#calc?" do
    context "降車駅設定なしの場合" do
      it "falseが返却されること" do
        ticket = create(:ticket)
        expect(ticket.calc?).to be_falsy
      end
    end

    context "料金が足りない場合" do
      let(:entered_gate) { create :gate, station_number: 1 }
      let(:exited_gate)  { create :gate, station_number: 2 }
      let(:ticket)       { create(:ticket, fare: 150, entered_gate_id: entered_gate.id, exited_gate_id: exited_gate.id) }

      before do
        allow_any_instance_of(Fare::Client).to receive(:seactons).and_return( {1 => 160, 2 => 190})
      end

      it "falseが返却されること" do
        expect(ticket.calc?).to be_falsy
      end
    end

    context "料金が足りている場合" do
      let(:entered_gate) { create :gate, station_number: 1 }
      let(:exited_gate)  { create :gate, station_number: 3 }
      let(:ticket)       { create(:ticket, fare: 190, entered_gate_id: entered_gate.id, exited_gate_id: exited_gate.id) }

      it "trueが返却されること" do
        expect(ticket.calc?).to be_truthy
      end
    end
  end
end
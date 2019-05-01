require "rails_helper"

SingleCov.covered!
RSpec.describe TicketsController, type: :controller do

  describe "#update" do
    let(:gate1) { create :gate, name: "梅田", station_number: 1 }
    let(:gate2) { create :gate, name: "十三", station_number: 2 }
    let(:gate3) { create :gate, name: "東三国", station_number: 3 }

    context "ticketが削除済みの場合" do
      before do
        put :update, params: {id: 9999}
      end

      it "statusが404で返却されること" do
        expect(response.status).to eq 404
      end

      it "エラーメッセージが返却されること" do
        expect(flash[:alert]).to eq "乗車情報は既に削除されています。"
      end
    end

    context "降車駅が設定されていない場合" do
      let(:ticket) { create :ticket, entered_gate_id: gate1.id }

      before do
        put :update, params: {id: ticket.id, ticket: {exited_gate_id: nil}}
      end

      it "編集画面が表示されること" do
        expect(response).to render_template(:edit)
      end

      it "エラーメッセージが返却されること" do
        expect(assigns(:ticket).errors.full_messages).to include "降車駅を入力してください。"
      end
    end

    context "降車駅がされている場合" do
      let(:ticket) { create :ticket, entered_gate_id: gate2.id }

      before do
        put :update, params: {id: ticket.id, ticket: {exited_gate_id: gate3.id}}
      end

      it "一覧に遷移すること" do
        expect(response).to redirect_to(tickets_url)
      end

      it "降車駅が設定されていること" do
        expect(ticket.reload.exited_gate_id).to eq(gate3.id)
      end

      it "メッセージが表示されること" do
        expect(flash[:notice]).to eq "#{gate3.name}で降車しました。"
      end
    end
  end
end

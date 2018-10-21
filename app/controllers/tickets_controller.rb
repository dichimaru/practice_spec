class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit

    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save

      redirect_to tickets_path, notice: "#{@ticket.entered_gate.name}から乗車しました。"
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  def update
    @ticket = Ticket.find(params[:id])
    unless @ticket.valid?
      return render :edit
    end
    @ticket.update(ticket_params)
    redirect_to tickets_path, notice: "#{@ticket.exited_gate.name}で降車しました。"
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: '乗車券を削除しました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:ticket).permit(:fare, :entered_gate_id, :exited_gate_id)
    end
end

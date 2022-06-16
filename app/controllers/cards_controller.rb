class CardsController < ApplicationController
    # before_action :card_params, only: [:show, :create, :update, :destroy] 
    def index
        @cards = current_user.cards.where(card_type: params[:card_type])
        # @cards = Card.all
        respond_to do |format|
            format.html
            format.csv { send_data @cards.to_csv }
            format.json { render json: CardDatatable.new(params, view_context: view_context) }
        end
    end

    def import
        current_user.cards.import(params[:file])
        redirect_to cards_path, notice: "Cards imported."
        # Card.open(params[:file])
    end

    def new
        @card = Card.new
    end

    def show
        @card = Card.find(params[:id])
    end

    def create
        @card = Card.new(card_params)
        # @card.save 
            if @card.save
            byebug
                CardWorkerJob.perform_later(@card.user_id)
                flash[:success] = "Thank you for your card! We'll get contact you soon!"
                redirect_to cards_path
            else
                flash.now[:error] = "Your card form had some errors. Please check the form and resubmit."
                render :new
            end

        # redirect_to cards_path
    end

    def edit
        @card = Card.find(params[:id])
    end

    def update
        @card = Card.find(params[:id])
        @card.update(card_params)
        redirect_to cards_path
    end

    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        redirect_to @card
    end

    private

    def set_card
        @card = Card.find(params[:id])
    end

    def card_params
        params.require(:card).permit(:name, :card_number, :cvv, :valid_from, :valid_thru, :card_type, :user_id).merge(user: current_user)
    end
end

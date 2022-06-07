class BillingsController < ApplicationController
    
    def index 

        respond_to do |format|
            format.html
            format.json { render json: BillingDatatable.new(params, view_context: view_context) }
        end
    end

    def new
        @card = Card.find(params[:card_id])
        @billing = @card.billings.new
    end

    def show

        @card = Card.find(params[:card_id])
        @billing = @card.billings.find(params[:id])

    end

    def edit
        @card = Card.find(params[:card_id])
        @billing = @card.billings.find(params[:id])
    end

    def create
        @card = Card.find(params[:card_id])
        @billing = @card.billings.build(billing_params)
        @billing.save
        redirect_to card_billings_path
    end

    def update
        @card = Card.find(params[:card_id])
        @billing = @card.billings.find(params[:id])
        @billing.update(billing_params)
        redirect_to card_billings_path
    end

    def destroy
        @card = Card.find_by(params[:id])
        @billing = @card.billings.find(params[:id])
        @billing.destroy
        redirect_to card_billings_path
    end

    private
        def billing_params
            params.require(:billing).permit(:name, :card_number, :cvv, :postal_code, :valid_from, :valid_thru, :total_amount, :amount_paid, :due_amount)
        end
end

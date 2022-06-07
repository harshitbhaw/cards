class BillingDatatable < AjaxDatatablesRails::ActiveRecord



  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name:         { source: "Billing.name" },
      card_number:  { source: "Billing.card_number" },
      cvv:          { source: "Billing.cvv" },
      postal_code:  { source: "Billing.postal_code" },
      valid_from:   { source: "Billing.valid_from" },
      valid_thru:   { source: "Billing.valid_thru" },
      total_amount: { source: "Billing.total_amount" },
      amount_paid:  { source: "Billing.amount_paid" },
      due_amount:   { source: "Billing.due_amount" },
    }
  end

  def data
    records.map do |record|
      {
        name:         record.name,
        # name:         link_to(record.name, edit_card_path(record)),
        card_number:  record.card_number,
        cvv:          record.cvv,
        postal_code:  record.postal_code,
        valid_from:   record.valid_from,
        valid_thru:   record.valid_thru,
        total_amount: record.total_amount,
        amount_paid:  record.amount_paid,
        due_amount:   record.due_amount,
        card_id:      record.card_id,
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    # Billing.all
    @card = Card.find(params[:card_id])
    @billings = @card.billings.all
  end
end

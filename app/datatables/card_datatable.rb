class CardDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id:         { source: "User.id" },
    name:         { source: "Card.name" },
    card_number:  { source: "Card.card_number" },
    cvv:          { source: "Card.cvv" },
    card_type:    { source: "Card.card_type", cond: :like, searchable: true, orderable: true },
    valid_from:   { source: "Card.valid_from" },
    valid_thru:   { source: "Card.valid_thru" },
    }
  end

  def data
    records.map do |record|
      {
        name:         record.name,
        card_number:  record.card_number,
        cvv:          record.cvv,
        card_type:    record.card_type,
        valid_from:   record.valid_from,
        valid_thru:   record.valid_thru,
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.alls
    # Card.all
    # if (card_type == "credit")
    #   Card.credit.all
    # else
    #   Card.debit.all
    # end
    @cards = Card.where(card_type: params[:card_type])
    # if params['credit'].present?
      # cards = cards.where(pstats[:card_type].gteq(params['credit']))
    #  @cards = Card.where(card_type: params[:card_type])
    # end
    # if params['debit'].present?
      # cards = cards.where(pstats[:card_type].lteq(params['debit']))
    #  @cards = Card.where(card_type: params[:card_type])
    # end
  end

end

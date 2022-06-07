class CardDatatable < AjaxDatatablesRails::ActiveRecord
  # delegate :edit_card_path, to: :@view
  # extend Forwardable
  delegate :params, to: :@view
  delegate :link_to, :edit_card_path, to: :@view


  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
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
        name:         link_to(record.name, record),
        # name:         link_to(record.name, edit_card_path(record)),
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
    # Card.all
    @cards = Card.where(card_type: params[:card_type])
  end
end
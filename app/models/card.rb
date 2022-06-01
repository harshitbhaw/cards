class Card < ApplicationRecord
  belongs_to :user
  has_many :billings
  # scope :debit, -> {where(card_type: debit)}
  # scope :credit, -> {where(card_type: credit)}
  # scope :active, -> { where("role: 0") }

  enum card_type: [ :credit, :debit]

  require 'csv'


  def self.to_csv
    attributes = %w{id name card_number cvv valid_from valid_thru card_type}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |card|
        csv << attributes.map{ |attr| card.send(attr) }
      end
    end
  end
  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |card|
  #       csv << card.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      current_scope.create row.to_hash
      # card_hash = row.to_hash
      # card = find_or_create_by!(name: card_hash['name'], card_name: card_hash['card_number'], cvv: card_hash['cvv'], valid_from: card_hash['valid_from'], valid_thru: card_hash['valid_thru'],)
      # card.update_attributes(card_hash)
    end 
  end
end

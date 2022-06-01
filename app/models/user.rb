class User < ApplicationRecord

  has_many :cards
  
  scope :active, -> { where("role: 0") }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  # after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed 
    else
      '/anjana.jpg'
    end
  end

  # private

  # def add_default_avatar
  #   unless avatar.attached?
  #     avatar.attach(
  #       io: File.open(
  #         Rails.root.join(
  #           'app', 'assets', 'images', 'default_avatar.jpg' 
  #         )
  #       ), filename: 'anjana.jpg',
  #       content_type: 'image/jpg'
  #     )
  #   end
  # end
end

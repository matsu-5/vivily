class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy

  has_many :musics, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item
  def already_favorited?(music)
    self.favorites.exists?(music_id: music.id)
  end

  has_many :carts, dependent: :destroy
  has_many :carted_items, through: :cartes, source: :item
  def already_carted?(music)
    self.cartes.exists?(music_id: music.id)
  end

   has_many :entries
   has_many :direct_messages
   has_many :rooms, through: :entries
   attachment :profile_image

  #validates :last_name, presence: true
  #validates :first_name, presence: true
  #validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は、カタカナを入力して下さい。" }
  #validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は、カタカナを入力して下さい。" }
  #validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は、(-)ハイフンを含む数字(3桁)-(4桁)を入力して下さい。" }
  #validates :address, presence: true
  #validates :phone_number, format: { with: /\A[0-9]{1,4}-[0-9]{1,4}-[0-9]{1,4}\z/, message: "は、(-)ハイフンを含む数字を入力して下さい。" }
end

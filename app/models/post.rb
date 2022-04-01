class Post < ApplicationRecord

  has_many :comments
  belongs_to :user

  def self.search(search)
    search ? where('game_name LIKE ?', "%#{search}%") : all
  end
end

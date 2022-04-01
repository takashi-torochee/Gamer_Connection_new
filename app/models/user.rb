class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image

        has_many :posts
        has_many :relationships
        has_many :comments


        enum play_time: { '平日昼間': 0, '平日夜間': 1, '土日昼間': 2, '土日夜間': 3, '不定期': 4 }
end

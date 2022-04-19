class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

         has_one_attached :profile

        has_many :posts
        has_many :comments
        
        has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :follow, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
        
        has_many :follow_user, through: :follower, source: :follow # 自分がフォローしている人
        has_many :follower_user, through: :follow, source: :follower # 自分をフォローしている人
        
 


        def follow(user_id)
          follower.create!(follow_id: user_id)
        end
      
        # ユーザーのフォローを外す
        def unfollow(user_id)
          follower.find_by(follow_id: user_id).destroy
        end
      
        # フォローしていればtrueを返す
        def follow?(user)
          follow_user.include?(user)
        end

        enum play_time: { '平日昼間': 0, '平日夜間': 1, '土日昼間': 2, '土日夜間': 3, '不定期': 4 }
        
        def self.search(search)
          search ? where('name LIKE ?', "%#{search}%") : all
        end
        


end

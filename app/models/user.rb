class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :friends
  has_many :tweets
  has_many :likes
  has_many :liked_tweets, :through => :likes, :source => :tweet


 
   #metodo para identificar todos los usuarios que son mis amigos, o que sigo
  def users_followed
    arr_ids = self.friends.pluck(:friend_id)
    User.find(arr_ids)
    
  end
  #metodo para saber si el usuario que le paso está en el listado completo de amigos que sigo
  def following?(user)
    users_followed.include? (user)
  end 

  def arr_friend_id
    self.friends.pluck(:friend_id)
  end
end



module LineItemsHelper

  def get_all_users
    User.all.collect do |user|
      [user.name, user.id] 
    end
  end

end

class User < ActiveRecord::Base
has_one :profile, :dependent => :destroy
#has_one  :join_table
#has_many :todo_lists, :through => :join_table, :source => :todo_lists
has_many :todo_lists, :dependent => :destroy

has_many :todo_items, :through => :todo_lists, :source => :todo_items, :dependent => :destroy

has_secure_password


validates :username, presence: true

###this was very difficult for some reason
def get_completed_count
 @list = User.joins(:todo_items).where("todo_items.completed = ?", true)
 return  @list.count
end



end

class TodoList < ActiveRecord::Base
belongs_to :user
has_many :todo_items, :dependent => :destroy ###was here before

default_scope { order('list_due_date ASC') }
end

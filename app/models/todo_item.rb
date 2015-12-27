class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  
  default_scope { order('due_date ASC') }

  
  #def self.completed(state)
  #if state = "true" then
	#completed.equals(:state)
	#else
	
  #end
  #end
end

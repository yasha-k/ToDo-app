module ToDoApp
	module Models
	  	class Task
	  	   include Lotus::Entity
	  	   self.attributes = :name
	  	end
	end
end	

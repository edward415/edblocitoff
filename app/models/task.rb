class Task < ActiveRecord::Base
  belongs_to :user
  
  def time_left
    "this his eeasf"
  end
  
end

class Message < ActiveRecord::Base
validates :content, :length => { :maximum => 140 }
end

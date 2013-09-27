class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :private, type: Boolean
  
  belongs_to  :note_book
end

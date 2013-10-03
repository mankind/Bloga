class NoteBook
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include AddsBelongsToActiveRecordToMongoid
  belongs_to_active_record :user
  
  include AddsHasManyActiveRecordToMongoid
  has_many_active_record :posts
  
  field :name, type: String
  
  has_many :notes
end

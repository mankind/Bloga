class NoteBook
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include AddsBelongsToActiveRecordToMongoid
  belongs_to_active_record :post
  
  field :name, type: String
  
  has_many :notes
end

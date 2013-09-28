
module AddsActiveRecordRelationshipToMongoid
  extend ActiveSupport::Concern
  included do
    
    def self.belongs_to_active_record(association_name, **options)
      
      association_class = options[:class_name] || association_name.to_s.singularize.classify
      class_eval <<-EOS
        field  :#{association_name}_id, type: Integer
        index(#index{association_name}_id: 1)

        def   #{association_name}
          @#{association_name} ||= #{association_class}.where(id: #{association_name}_id).first  if #{association_name}_id
        end

        def #{association_name}= (object)
          @#{association_name}  = object
          self.#{association_name}_id = object.try :id
         end
      EOS
    end
  end
end
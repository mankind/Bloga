#add a migration with foreign_key pointing to the name of the mongoid model
module AddsBelongsToMongoidToActiveRecord
  extend ActiveSupport::Concern
  
  included do
    def self.belongs_to_mongoid(association_name, **options)
      association_class = options[:class_name] || association_name.to_s.singularize.classify
      class_eval <<-EOS
        def #{association_name}
          @#{association_name} ||= #{association_class}.where(id: #{association_name}_id).first if #{association_name}_id
        end

        def #{association_name}=(object)
          @#{association_name} = object
          self.#{association_name}_id = object.try :id
        end
      EOS
    end
    
    
  end
  
end
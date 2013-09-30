module AddsHasManyActiveRecordToMongoid
  extend ActiveSupport::Concern
  included do
    def self.has_many_active_record(association_name)
      class_eval <<-EOS
        def #{association_name}
          @#{association_name} ||= #{association_name.to_s.classify}.find_by(#{name.underscore}_id: self.id.to_s)
        end
      EOS
      
    end
  end
end
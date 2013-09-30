#thanks to Kevin Wang for posting http://hashrocket.com/blog/posts/bridging-activerecord-and-mongoid

  #association_name creates an instance method
  #singularize(word) returns the singular form of a word
  #classify(table_name) creates a class name from a plural table name eg   'posts.classify' => 'Post'
  #underscore(camel_cased_word) Makes an underscored, lowercase form from the expression in the string.
  #eg of undrscore -'ActiveModel'.underscore # => "active_model"
  #class_eval defines instance methods.
  #class_eval evaluates a string/block  in the context of the module or class.
  #underscore(camel_cased_word) makes an underscore eg 'ActiveModel'.underscore => 'active_model'

module AddsHasManyMongoidToActiveRecord
  extend ActiveSupport::Concern
  included do
      def self.has_many_mongoid_documents(association_name)
        class_eval <<-EOS
          def #{association_name}
            @#{association_name} ||= #{association_name.to_s.classify}.where(#{name.underscore}_id: self.id)
          end

        EOS
      end

    end 

end


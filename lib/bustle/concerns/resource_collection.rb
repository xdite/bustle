module Bustle::Conern
  module ResourceCollection
    extend ActiveSupport::Concern

    module ClassMethods
      
      def add(resource)
        self::RESOURCE_NAME.constantize.find_or_create_by_resource_class_and_resource_id(
          :resource_class => resource.class.name,
          :resource_id    => resource.id
        )
      end

      def get(resource)
        self::RESOURCE_NAME.constantize.to_adapter.find_first(
          :resource_class => resource.class.name,
          :resource_id    => resource.id
        )
      end

      def remove(resource)
        get(resource).destroy
      end
    end
  end
end

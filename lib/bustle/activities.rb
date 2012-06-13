module Bustle
  class Activities
    class << self
      def add(publisher, action, activity_resource)
        Activity.to_adapter.create!(
          :resource_class => activity_resource.class.name,
          :resource_id    => activity_resource.id,
          :action         => action,
          :publisher_id   => publisher.id
        )
      end
      
      def for(subscriber)
        publisher_ids = Subscriptions.for(subscriber).map(&:publisher_id)
        Activity.where(:publisher_id =>  publisher_ids )
      end
 
      def by(publisher)
        Activity.where(:publisher_id =>  publisher.id )
      end
      
      def filter(options = {}, *rest)
        Activity.where(options, *rest)
      end
    end
  end
end

module Bustle
  class Subscriptions
    class << self
      def add(publisher, subscriber)
        Subscription.to_adapter.create!(
          :publisher_id  => publisher.id,
          :subscriber_id => subscriber.id
        )
      end

      def get(publisher, subscriber)
        Subscription.to_adapter.find_first(
          :publisher_id  => publisher.id,
          :subscriber_id => subscriber.id
        )
      end

      def remove(publisher, subscriber)
        get(publisher, subscriber).destroy
      end

      def by(publisher)
        Subscription.where(
          :publisher_id  => publisher.id
        )
      end

      def for(subscriber)
        Subscription.where(
          :subscriber_id => subscriber.id
        )
      end

      def filter(options = {})
        Subscription.where(options)
      end
    end
  end
end

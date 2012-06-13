module Bustle
  class Activity < "#{Bustle.storage}::Activity".constantize
    def publisher
      Publisher.where(:id => publisher_id).first
    end
  end
end

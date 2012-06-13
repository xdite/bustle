module Bustle
  class Subscription < "#{Bustle.storage}::Subscription".constantize
    
    def activities(options = {})
      Activities.filter(options)
    end
    
  end
end

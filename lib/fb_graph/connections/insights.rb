module FbGraph
  module Connections
    module Insights
      def insights(options = {})
        options[:access_token] ||= self.access_token
        options[:access_token] ||= get_access_token(options[:secret]) if respond_to?(:get_access_token)
        insights = self.connection(:insights, options)
        insights.map! do |insight|
          Insight.new(insight.delete(:id), insight.merge(:access_token => options[:access_token]))
        end
      end
    end
  end
end
module OracleDBWrapper
  class Config
    @settings = {}

    class << self
      attr_accessor :settings

      def configure
        yield(settings)
      end
    end
  end
end

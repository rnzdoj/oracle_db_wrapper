module OracleDBWrapper
  class Config
    @settings = {
      adapter: "oracle_enhanced",
      database: "db",
      username: "username",
      password: "password",
      host: "host",
      port: 1521
    }

    class << self
      attr_accessor :settings

      def configure
        yield(settings)
      end
    end
  end
end

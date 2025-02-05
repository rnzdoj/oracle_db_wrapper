module OracleDBWrapper
  class Connection
    def initialize
      @connection = ActiveRecord::Base.establish_connection(OracleDBWrapper::Config.settings).connection
    end

    def execute(query, binds = [])
      sanitized_query = ActiveRecord::Base.sanitize_sql_array([query, *binds])
      @connection.exec_query(sanitized_query)
    rescue StandardError => e
      puts "OracleDB Error: #{e.message}"
      nil
    end

    def transaction
      @connection.transaction do
        yield
      end
    rescue StandardError => e
      puts "Transaction failed: #{e.message}"
      raise ActiveRecord::Rollback
    end

    def close
      @connection.disconnect!
    end
  end
end

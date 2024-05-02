require 'connection_pool'
require 'pg'

DB = ConnectionPool.new(size: ENV['DB_POOL_SIZE'].to_i, timeout: ENV['DB_TIMEOUT'].to_i) do
  PG.connect(
    dbname: ENV['DB_NAME'], 
    user: ENV['DB_USERNAME'], 
    password: ENV['DB_PASSWORD'], 
    host: ENV['DB_HOST'],
    port: ENV['DB_PORT']
  )
end

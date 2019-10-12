# Factory_botメソッドを省略して記述できる
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
require_relative 'app'

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  run_app(app)
end

main

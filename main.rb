require_relative './app'
class Main
  def initialize
    @app = App.new
  end

  print "Welcome to the School Library App!\n"
  def options
    option = 0
    while option != 7
      print "\nPlease choose an option by entering a number: \n"
      print "1 - list all books\n"
      print "2 - list all people\n"
      print "3 - create a person\n"
      print "4 - create a book\n"
      print "5 - create a rental\n"
      print "6 - list all rentals for a given person id\n"
      print "7 - exit\n"
      start
    end
  end

  def start
    option = gets.chomp.to_i
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.rent_book
    when 6
      @app.list_rentals
    else
      @app.exit_app
    end
  end
end

main = Main.new
main.options

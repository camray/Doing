require 'thor'

module Doing
  class CLI < Thor
    DOING_LINE = "# Doing"
    TODO_LINE = "# ToDo"
    DONE_LINE = "# Done"
    BLANK_LIST = DOING_LINE+ "\n\n" + TODO_LINE + "\n\n" + DONE_LINE
    FILE_LOCATION = "doing.markdown"

    desc "create", "Creates an empty todo file"
    def create(force = false)
      if !File.exists?(FILE_LOCATION) || force
        reset
      else
        puts "ToDo already exists, call 'reset' to reset the project"
      end
    end

    desc "reset", "Emptys the current todo list and starts fresh"
    def reset
      f = File.new(FILE_LOCATION, 'w')
      f.puts BLANK_LIST
      puts "Blank doing file added at #{Dir.pwd}/#{FILE_LOCATION}"
    end

    desc "list [WHICH]", "Lists the tasks for each section, or all if empty"
    def list(which = nil)
      unless which
        puts get_file_contents
        return
      end

      create unless file_exists
      contents = get_file_contents

      arr = []
      inc = false
      contents.each_line do |line|
        if inc && line.include?("\n")
          if line.include?("# ")
            break
          else
            arr << line
          end
        end

        inc = true if line.downcase.include? "# #{which}".downcase
      end # each line of file

      arr.reverse.drop(1).reverse.each do |line|
        puts line.strip
      end
    end

    desc "add [WHERE] [ITEM]", "Add an ITEM to a list"
    def add(where, item)
      create unless file_exists
      contents = get_file_contents
      tempfile=File.open("file.tmp", 'w')

      contents.each_line do |line|
        tempfile << line
        if line.downcase.include?("# ") && line.downcase.include?(where.downcase)
          tempfile << "  - #{item}\n"
        end
      end

      FileUtils.mv("file.tmp", FILE_LOCATION)
    end

    private

    def get_file_contents
      return unless file_exists
      return File.open(FILE_LOCATION).read
    end

    def file_exists
      File.exists?(FILE_LOCATION)
    end

  end
end

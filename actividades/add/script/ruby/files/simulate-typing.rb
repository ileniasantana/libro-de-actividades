#!/usr/bin/ruby
# encoding: utf-8
#
# Simulate typing
# * https://www.linuxjournal.com/content/simulate-typing-c-program

require 'rainbow'

class SimulateTyping

  def initialize(filename = 'simulate-typing.txt')
    @filename = filename
    content = `cat #{@filename}`
    @lines = content.split("\n")
    #lines = ['pwd','whoami','ls']
    @prompt = "simulating> "
  end

  def play
    @lines.each do |command|
      sleep(0.2)
      print @prompt
      sleep(0.2)
      print_with_delay(command,0.4)
      #  gets
      print "\n"
      sleep(0.3)
      output = execute_this command
      print_with_delay(output,0.04)
    end
    puts "Bye-bye! Simulation end!"
  end

  def print_with_delay(text, seconds)
    text.each_char do |c|
      sleep(seconds)
  #    print(Rainbow.(c.to_s).color(:blue))
      print(c)
    end
  end

  def execute_this(command)
    output = ''
    begin
      output = `#{command}`
    rescue Exception => e
      puts "[ERROR] comando incorrecto: #{e}"
    end
    output
  end

end

SimulateTyping.new.play

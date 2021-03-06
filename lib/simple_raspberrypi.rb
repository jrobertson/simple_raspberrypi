#!/usr/bin/env ruby

# file: simple_raspberrypi.rb

# desc: This gem is similar to the rpi gem, with the only 
#       difference being the class name and this gem has no dependencies.


require 'rpi_pinout'


class SimpleRaspberryPi  
    
  def initialize(x=[])
    
    a = case x
    when Integer
      [x]    
    when Fixnum
      [x]
    when String
      [x]
    when Array
      x
    end
    
    @pins = a.map {|pin| RPiPinOut.new pin }
    
    def @pins.[](i)

      if i.to_i >= self.length then
        puts "RPi warning: RPiPinOut instance #{i.inspect} not found"
        PinX::Void.new
      else
        self.at(i)
      end 
    end    
  
  end

  def pin()   @pins.first  end
  def pins()  @pins        end
    
end


if __FILE__ == $0 then
  # example
  my_rpi = SimpleRaspberryPi.new %w(17 22 18 4 23 25 27) # <-- each pin connects to an LED
  my_rpi.pins[ARGV.first.to_i].method(ARGV.last.to_sym).call
end

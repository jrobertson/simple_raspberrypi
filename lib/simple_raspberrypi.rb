#!/usr/bin/env ruby

# file: simple_raspberrypi.rb

# desc: This gem is similar to the rpi gem, with the only 
#       difference being the class name and this gem depends upon 
#       rpi_gpio instead of the pi_piper gem which depends upon wiringpi.

require 'rpi_gpio'


HIGH = 1
LOW = 0

class SimpleRaspberryPi  
  

  class PinX
    include RPi
    
    def initialize(id)
      
      GPIO.setup id, :as => :output
      @id = id
      
    end

    def on(duration=nil)

      set_pin HIGH; 
      @state = :on
      (sleep duration; self.off) if duration
    end

    def off(duration=nil)

      return if self.off?
      set_pin LOW      
      @state = :off
      (sleep duration; self.on) if duration
    end
    
    alias high on # opposite of low
    alias open on # opposite of close
    alias lock on # opposite of unlock
    
    alias stop off        
    alias low off
    alias close off
    alias unlock off

    def blink(seconds=0.5, duration: nil)

      @state = :blink
      t2 = Time.now + duration if duration

      Thread.new do
        while @state == :blink do
          (set_pin HIGH; sleep seconds; set_pin LOW; sleep seconds) 
          self.off if duration and Time.now >= t2
        end
        
      end
    end
    
    alias oscillate blink

    def on?()  @state == :on  end
    def off?() @state == :off end

    # set val with 0 (off) or 1 (on)
    #
    def set_pin(val)

      state = @state
      val == HIGH ? GPIO.set_high(@id) : GPIO.set_low(@id)
      @state = state
    end
    
    def to_s()
      @id
    end
  end
  
  class Void
    def on(duration=nil)               end
    def off()                          end
    def blink(seconds=0, duration=nil) end
    alias stop off
  end  

  def initialize(x=[])

    RPi::GPIO.set_numbering :bcm  
    
    a = case x
    when Fixnum
      [x]
    when String
      [x]
    when Array
      x
    end
    
    
    @pins = a.map {|pin| PinX.new pin.to_i }
    
    def @pins.[](i)

      if i.to_i >= self.length then
        puts "RPi warning: PinX instance #{i.inspect} not found"
        Void.new
      else
        self.at(i)
      end 
    end    
    
    at_exit do
      
      # to avoid "Device or resource busy @ fptr_finalize - /sys/class/gpio/export"
      # we unexport the pins we used
      
      #unexport_all a
      RPi::GPIO.reset
    end    
  end

  def pin()   @pins.first  end
  def pins()  @pins        end
    
  def unexport_all(pins)
    
    pins.each do |pin|
      
      next unless File.exists? '/sys/class/gpio/gpio' + pin.to_s

      File.write "/sys/class/gpio/unexport", pin

    end
    
  end
  
  def on_exit
    unexport_all @pins
  end
  
  def self.unexport(a)
    a.each {|pin| File.write "/sys/class/gpio/unexport", pin }
  end

end


if __FILE__ == $0 then
  # example
  my_rpi = SimpleRaspberryPi.new %w(17 22 18 4 23 25 27) # <-- each pin connects to an LED
  my_rpi.pins[ARGV.first.to_i].method(ARGV.last.to_sym).call
end

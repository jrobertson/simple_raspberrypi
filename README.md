# Using the Simple RaspberryPi gem


    require 'simple_raspberrypi' 

    red = SimpleRaspberryPi.new(4).pin
    red.blink duration: 5

The above code will make a red LED (attached to GPIO 4) blink for 5 seconds.

## Resources

* simple_raspberrypi https://rubygems.org/gems/simple_raspberrypi

raspberrypi rpi led pins blink

require "midi"
require 'io/console'

# Trap ^C
# Signal.trap("INT") {
  # midi.off
  # shut_down
  # exit
# }

@output = UniMIDI::Output.open(:first)

# MIDI.using(@output) do
# octave 4

# while(str = STDIN.getch)
  # puts str
    # play str, 0.5
# end
# end


midi = MIDI::Session.new(@output)
midi.off
# midi.cc(5, 120)

10.times do
  5.times do |oct|
    midi.octave oct
    %w{C E G B}.each { |n|
      midi.play n, 0.1
      midi.cc(5, 120)
    }
  end
end



# Trap `Kill `
# Signal.trap("TERM") {
  # midi.off
  # shut_down
  # exit
# }

#todo
# - send control messages
# - read midi file and play it constantly

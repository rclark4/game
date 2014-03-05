def prompt
  print "> "
end

def pause
  sleep 0.4
end

def dramatic_pause
  pause * 2
end

def type text
  text.each_char { |char|
    putc char
    sleep 0.04
  }
end

def quick_type text
  text.each_char { |char|
    putc char
    sleep 0.01
  }
end

def br text, space=1
  "#{text}" + ("\n" * space)
end

# This is where the player begins the game
def play
  puts br "", 4
  puts "                      SPACE COMMANDER"
  puts br "========================================================", 2
  type br "You awake in total darkness. The still, cold air hums"
  type br "with the familiar drone of starship engines.", 2
  pause
  type br "A voice chirps through the dark in crisp static...", 2
  dramatic_pause
  type br "\"Commander...\"", 2
  dramatic_pause
  type br "Type your name:"
  prompt; @name = gets.chomp
  conversation_one
end

def conversation_one
  type br "\n\"Commander #{@name}, can you hear me?\"", 2
  quick_type br "How do you respond?", 2
  quick_type br "1: \"Copy that... Identify yourself, soldier..\""
  quick_type br "2: \"Yeah, I hear you. What happened? Where am I?\""
  quick_type br "3: \"Ugh, and I was having such a lovely dream.\""
  quick_type br "4: (stay silent)", 2
  prompt; choice = gets.chomp
  conversation_one_reply choice
end

def conversation_one_reply choice
  if choice == "1"
    type br "\"Ensign Davis, sir. Thank God, we thought... Are you all right, sir?\""
    type br "We thought.... Well, we thought you were dead.\"", 2
    replay
  elsif choice == "2"
    type br "\"Frankly, sir, we don't know. Until just now, we thought..."
    type br "We thought you were dead.\"", 2
    replay
  elsif choice == "3"
    type br "\"Sir, I'm sorry to wake you, but we... We thought you were dead.\"", 2
    replay
  elsif choice == "4"
    type br "\n\"Commander?\""
    conversation_one
  else
    puts "Enter a number to choose your response."
    prompt; second_choice = gets.chomp
    conversation_one_reply second_choice
  end
end

def replay
  type br "Play again?"
  prompt; input = gets.chomp
  if input.include? "y"
    play
  else
    puts "GAME OVER"
    exit
  end
end

play

# Relationship Psuedo Methods
def love? number
  number > 19
end

def loyal? number
  (17..19).cover? number
end

def approve? number
  (12..16).cover? number
end

def disapprove? number
  (2..6).cover? number
end

def indifferent? number
  (7..11).cover? number
end

def hate? number
  (0..1).cover? number
end

def murderous? number
  number < 0
end

def social_standing number
  murderous?(number) || hate?(number) || disapprove?(number) || indifferent?(number) || approve?(number) || loyal?(number) || love?(number)
end

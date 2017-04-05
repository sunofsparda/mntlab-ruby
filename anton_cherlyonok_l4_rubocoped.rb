Inspecting 1 file
W

Offenses:

anton_cherlyonok_l4.rb:3:1: C: Missing top-level class documentation comment.
class Cli
^^^^^
anton_cherlyonok_l4.rb:4:14: C: [Corrected] Freeze mutable objects assigned to constants.
  Commands = []
             ^^
anton_cherlyonok_l4.rb:7:26: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    command = name.split(" ")
                         ^^^
anton_cherlyonok_l4.rb:8:34: C: [Corrected] Space missing to the left of {.
    command_class = Commands.find{|e| e.name == command[0]}
                                 ^
anton_cherlyonok_l4.rb:8:34: C: [Corrected] Space between { and | missing.
    command_class = Commands.find{|e| e.name == command[0]}
                                 ^^
anton_cherlyonok_l4.rb:8:59: C: [Corrected] Space missing inside }.
    command_class = Commands.find{|e| e.name == command[0]}
                                                          ^
anton_cherlyonok_l4.rb:9:5: C: [Corrected] Favor unless over if for negative conditions.
    command_class.new.run(command[1]) if !command_class.nil?
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
anton_cherlyonok_l4.rb:9:56: C: [Corrected] Prefer !expression.nil? over expression != nil.
    command_class.new.run(command[1]) if command_class != nil
                                                       ^^
anton_cherlyonok_l4.rb:15:45: C: [Corrected] Prefer single-quoted strings inside interpolations.
    puts "current time: #{Time.now.strftime("%H:%M:%S")}"
                                            ^^^^^^^^^^
anton_cherlyonok_l4.rb:16:26: C: [Corrected] Prefer $PROGRAM_NAME over $0.
    puts "script name: #{$0}"
                         ^^
anton_cherlyonok_l4.rb:17:9: W: (...) interpreted as grouped expression.
    puts (args[0]).to_s
        ^
anton_cherlyonok_l4.rb:17:10: C: [Corrected] Prefer to_s over string interpolation.
    puts "#{args[0]}"
         ^^^^^^^^^^^^
anton_cherlyonok_l4.rb:21:1: C: Missing top-level class documentation comment.
class Help < Cli
^^^^^
anton_cherlyonok_l4.rb:22:1: C: [Corrected] Extra empty line detected at class body beginning.
anton_cherlyonok_l4.rb:24:11: C: [Corrected] Trailing whitespace detected.
    'help'    
          ^^^^
anton_cherlyonok_l4.rb:32:16: C: [Corrected] Prefer !expression.nil? over expression != nil.
    if args[0] != nil
               ^^
anton_cherlyonok_l4.rb:33:31: C: [Corrected] Space missing to the left of {.
      cmd = Cli::Commands.find{|e| e.name == args[0]}
                              ^
anton_cherlyonok_l4.rb:33:31: C: [Corrected] Space between { and | missing.
      cmd = Cli::Commands.find{|e| e.name == args[0]}
                              ^^
anton_cherlyonok_l4.rb:33:53: C: [Corrected] Space missing inside }.
      cmd = Cli::Commands.find{|e| e.name == args[0]}
                                                    ^
anton_cherlyonok_l4.rb:36:5: C: [Corrected] Use 2 (not 0) spaces for indentation.
    Cli::Commands.each{|value| say "#{value.name} #{value.description}"}
    
anton_cherlyonok_l4.rb:36:23: C: [Corrected] Space missing to the left of {.
    Cli::Commands.each{|value| say "#{value.name} #{value.description}"}
                      ^
anton_cherlyonok_l4.rb:36:23: C: [Corrected] Space between { and | missing.
    Cli::Commands.each{|value| say "#{value.name} #{value.description}"}
                      ^^
anton_cherlyonok_l4.rb:36:72: C: [Corrected] Space missing inside }.
    Cli::Commands.each{|value| say "#{value.name} #{value.description}"}
                                                                       ^
anton_cherlyonok_l4.rb:39:1: C: [Corrected] Extra empty line detected at class body end.
anton_cherlyonok_l4.rb:40:1: C: Missing top-level class documentation comment.
class Echo < Cli
^^^^^
anton_cherlyonok_l4.rb:42:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:44:1: C: [Corrected] Extra empty line detected at class body beginning.
anton_cherlyonok_l4.rb:46:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "echo"
    ^^^^^^
anton_cherlyonok_l4.rb:50:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "- Display a line of text"
    ^^^^^^^^^^^^^^^^^^^^^^^^^^
anton_cherlyonok_l4.rb:50:6: W: (...) interpreted as grouped expression.
    p (args[0])
     ^
anton_cherlyonok_l4.rb:54:1: C: Missing top-level class documentation comment.
class Date < Cli
^^^^^
anton_cherlyonok_l4.rb:58:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:60:1: C: [Corrected] Extra empty line detected at class body beginning.
anton_cherlyonok_l4.rb:62:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "date"
    ^^^^^^
anton_cherlyonok_l4.rb:66:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "current time"
    ^^^^^^^^^^^^^^
anton_cherlyonok_l4.rb:68:1: C: Missing top-level class documentation comment.
class Uptime < Cli
^^^^^
anton_cherlyonok_l4.rb:69:12: W: [Corrected] Unused method argument - args. If it's necessary, use _ or _args as an argument name to indicate that it won't be used. You can also write as run(*) if you want the method to accept any arguments but don't care about them.
  def run(*args)
           ^^^^
anton_cherlyonok_l4.rb:72:1: C: [Corrected] Extra empty line detected at class body end.
anton_cherlyonok_l4.rb:75:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:78:5: W: Useless assignment to variable - uptime. Did you mean uptime_value?
    uptime = `cat /proc/uptime`.split(' ')[0].to_i
    ^^^^^^
anton_cherlyonok_l4.rb:78:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "uptime"
    ^^^^^^^^
anton_cherlyonok_l4.rb:80:3: C: [Corrected] Use empty lines between method definitions.
  def self.description
  ^^^
anton_cherlyonok_l4.rb:81:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "show uptime"  
    ^^^^^^^^^^^^^
anton_cherlyonok_l4.rb:81:18: C: [Corrected] Trailing whitespace detected.
    "show uptime"  
                 ^^
anton_cherlyonok_l4.rb:83:3: C: [Corrected] Use empty lines between method definitions.
  def run(*args)
  ^^^
anton_cherlyonok_l4.rb:83:12: W: [Corrected] Unused method argument - args. If it's necessary, use _ or _args as an argument name to indicate that it won't be used. You can also write as run(*) if you want the method to accept any arguments but don't care about them.
  def run(*args)
           ^^^^
anton_cherlyonok_l4.rb:84:39: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    uptime = `cat /proc/uptime`.split(" ")[0].to_i
                                      ^^^
anton_cherlyonok_l4.rb:86:1: C: Missing top-level class documentation comment.
class Ping < Cli
^^^^^
anton_cherlyonok_l4.rb:87:1: C: [Corrected] Extra empty line detected at class body beginning.
anton_cherlyonok_l4.rb:92:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:93:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:95:1: C: [Corrected] Trailing whitespace detected.
anton_cherlyonok_l4.rb:97:5: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "ping"
    ^^^^^^
anton_cherlyonok_l4.rb:109:18: C: [Corrected] Trailing whitespace detected.
      puts 'true' 
                 ^
anton_cherlyonok_l4.rb:110:9: C: [Corrected] Trailing whitespace detected.
    else 
        ^
anton_cherlyonok_l4.rb:113:1: C: [Corrected] Extra empty line detected at method body end.
anton_cherlyonok_l4.rb:115:1: C: [Corrected] Extra empty line detected at class body end.
anton_cherlyonok_l4.rb:118:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:119:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:120:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:121:1: C: [Corrected] Extra blank line detected.
anton_cherlyonok_l4.rb:125:15: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
  print user, "@", hostname, " #cli >> "
              ^^^
anton_cherlyonok_l4.rb:125:30: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
  print user, "@", hostname, " #cli >> "
                             ^^^^^^^^^^^
anton_cherlyonok_l4.rb:128:20: C: [Corrected] Space inside parentheses detected.
Cli::Commands.push( Help, Echo, Date, Uptime, Ping )
                   ^
anton_cherlyonok_l4.rb:128:51: C: [Corrected] Space inside parentheses detected.
Cli::Commands.push( Help, Echo, Date, Uptime, Ping )
                                                  ^
anton_cherlyonok_l4.rb:129:17: C: [Corrected] Prefer single-quoted strings when you don't need string interpolation or special symbols.
input_command = ""
                ^^
anton_cherlyonok_l4.rb:137:1: C: [Corrected] 1 trailing blank lines detected.

1 file inspected, 67 offenses detected, 58 offenses corrected

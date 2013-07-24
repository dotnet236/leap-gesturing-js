config = require './config'

Leap = require 'leapjs'
ChildProcess = require 'child_process'

terminal = ChildProcess.spawn 'bash'
executeBashCommand = (command) ->
  terminal.stdin.write command
  terminal.stdin.end()
  terminal = ChildProcess.spawn 'bash'

lastFingerCount = 0

Leap.loop (frame) ->
  hands = frame.hands
  handCount = frame.hands.length

  if hands.length > 0
    if lastFingerCount is 0
      for gesture in config.gestures
        if hands.length == gesture.handCount
          if hands[0].fingers.length == gesture.fingerCount
            executeBashCommand gesture.command
    lastFingerCount = hands[0].fingers.length
  else
    lastFingerCount = 0

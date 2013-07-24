Leap = require 'leapjs'
ChildProcess = require 'child_process'

terminal = ChildProcess.spawn 'bash'
activateAppWindow = (appName) ->
  terminal.stdin.write "osascript activate_application.scpt '#{appName}'"
  terminal.stdin.end()
  terminal = ChildProcess.spawn 'bash'

isUp = (direction) ->
  direction[0] > 0.2

lastFingerCount = 0

Leap.loop (frame) ->
  hands = frame.hands

  if hands.length > 0
    if lastFingerCount == 0
      hand = hands[0]
      fingerCount = hand.fingers.length
      lastFingerCount = fingerCount

      up = false || isUp(frame.pointables[0].direction) if frame.pointables.length > 0

      switch fingerCount
        when 1 then activateAppWindow "Google Chrome"
        when 2 then activateAppWindow "iTerm"
  else
    lastFingerCount = 0

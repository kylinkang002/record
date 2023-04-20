#!/bin/sh
# Activate an existing Chrome window or start a new one if none exists
chrome_window_id=$(xdotool search --onlyvisible --class "chrome" | head -1)
if [ -z "$chrome_window_id" ]; then
  google-chrome-stable &
  sleep 1 # wait for the browser to start
  chrome_window_id=$(xdotool search --onlyvisible --class "chrome" | head -1)
fi

# Activate the Chrome window
xdotool windowactivate $chrome_window_id

# Open the URL in a new tab
xdotool key "ctrl+t"
sleep 0.5 # wait for the new tab to open
xdotool type "twitter.com"
xdotool key "Return"


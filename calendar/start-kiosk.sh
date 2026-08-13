#!/bin/bash
sleep 5
# Auto-copy latest calendar to nginx on every boot
sudo cp /home/pi/calendar/family-calendar.html /var/www/html/
sudo cp /home/pi/calendar/manifest.json /var/www/html/
sudo cp /home/pi/calendar/sw.js /var/www/html/
unclutter -idle 0 &
xset s off
xset s noblank
DISPLAY=:0 chromium --password-store=basic --kiosk --noerrdialogs --disable-infobars \
  --disable-session-crashed-bubble \
  --disable-restore-session-state \
  --no-first-run \
  --app=http://localhost/family-calendar.html

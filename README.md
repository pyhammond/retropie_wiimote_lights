Light up your Wii controllers with retropie_wiimote_lights
==========================================================
This group of scripts simply enables your RetroPie box to light up the lights correctly
when you are using either Wii Controllers or Wii U Pro Controllers (I have 3 of these and
they rock !)

### Important

This script expects to live in /home/pi/retropie_wiimote_lights.  See below for moving it
elsewhere

### Installation Instructions

Login to your Retropie box as the 'pi' user and simply run:

	`(cd && git clone http://github.com/pyhammond/retropie_wiimote_lights)`

Once your git clone is finished, simply run this command to install to retropie:

	`(cd ~/retropie_wiimote_lights && ./install.sh)`

Reboot to see it all work in action.  When the first Wii controller connects,
there is only one light.  For the second, two lights, and so on...

### Retropie Version

This is known to work well with RetroPie v4.2 and above.

### What controllers should these work with ?

They should work well with either normal Wii Controllers or Wii U Pro Controllers.

These are the Wii U Pro controllers I wrote them for: http://amzn.com/B00SN1QEGW

Two things you could tweak if needed:
-------------------------------------

1. If you need to change the path of where these scripts live, you should only need
   to edit 1 file: wii-controller.service.  Just change the line with ExecStart on it.

2. If you are annoyed by waiting 2 seconds before the lights light up correctly and
   you feel lucky, you can tweak the amount of time it waits for the bluetooth connection
   to complete before checking for the appropriate directories and lighting up the lights.

   This is the "sleep" command found at the very top (line 3) of wii-lights.sh.  I had it on
   "sleep 1" for a while and it seemed to work, but occassionally wouldn't, so...
# retropie_wiimote_lights

This group of scripts simply enables your RetroPie box to light up the lights correctly
when you are using either Wii Controllers or Wii U Pro Controllers (I have 3 of these and
they rock !)

Installation Instructions:  Login to your Retropie box as the 'pi' user and simply run:

	(cd && git clone http://github.com/pyhammond/retropie_wiimote_lights)

SUPER IMPORTANT: This script expects to live in /home/pi/retropie_wiimote_lights
Once your git clone is finished, simply run this command to install to retropie:

	(cd ~/retropie_wiimote_lights && ./install.sh)

Reboot to see it all work in action.  When the first Wii controller connects,
there is only one light.  For the second, two lights, and so on...

This is known to work well with RetroPie v4.2 and above.

These are the Wii U Pro controllers I wrote them for:
http://amzn.com/B00SN1QEGW

They work awesome with RetroPie.

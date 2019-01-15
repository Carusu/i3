out_to_x no
own_window no
out_to_console yes
background no
max_text_width 0
alignment top_right


# Update interval in seconds
update_interval 1.0

# This is the number of times Conky will update before quitting.
# Set to zero to run forever.
total_run_times 0

# Shortens units to a single character (kiB->k, GiB->G, etc.). Default is off.
short_units yes

# How strict should if_up be when testing an interface for being up?
# The value is one of up, link or address, to check for the interface
# being solely up, being up and having link or being up, having link
# and an assigned IP address. 
if_up_strictness address

# Add spaces to keep things from moving about?  This only affects certain objects.
# use_spacer should have an argument of left, right, or none
use_spacer left

# Force UTF8? note that UTF8 support required XFT
override_utf8_locale no

# number of cpu samples to average
# set to 1 to disable averaging
cpu_avg_samples 2

# Stuff after 'TEXT' will be formatted on screen
TEXT

# JSON for i3bar

 [\
  ${if_up wifi0}
   {"full_text" : "wifi0: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
     {"full_text":"${if_match "${execi 10 /home/antonio/bin/wifi_signal_quality.run index}" == "2"}_${execi 10 /home/antonio/bin/wifi_signal_quality.run pc}% on ${execi 10 iw dev wifi0 link | awk  '/SSID/ {print $NF}'} ","color":"\#007CFF","separator":false,"separator_block_width":5},\
   {"full_text":"${else}"},\
     {"full_text":"${if_match "${execi 10 /home/antonio/bin/wifi_signal_quality.run index}" == "1"}_${execi 10 /home/antonio/bin/wifi_signal_quality.run pc}% on ${execi 10 iw dev wifi0 link | awk  '/SSID/ {print $NF}'} ","color":"\#FFA500","separator":false,"separator_block_width":5},\
   {"full_text":"${else}"},\
     {"full_text":"${if_match "${execi 10 /home/antonio/bin/wifi_signal_quality.run index}" == "0"}_${execi 10 /home/antonio/bin/wifi_signal_quality.run pc}% on ${execi 10 iw dev wifi0 link | awk  '/SSID/ {print $NF}'} ","color":"\#e50000","separator":false,"separator_block_width"5},\
     {"full_text":"${endif}${endif}${endif}"},\
   {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":false,"separator_block_width":0, "markup": "pango", "color" : "\#EEEEEC","separator":false,"separator_block_width":5},\
   {"full_text" : "${addr wifi0}" , "color" : "\#007CFF" ,"separator":false,"separator_block_width":5},\
   {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":false,"separator_block_width":0, "markup": "pango", "color" : "\#EEEEEC","separator":false,"separator_block_width":5},\
   {"full_text" : "${execi 300 /home/antonio/bin/myip.sh}" , "color" : "\#007CFF" ,"separator":true,"separator_block_width":20},\
${else} 
   {"full_text" : "wifi0 unassigned" , "color" : "\#e50000" ,"separator":true,"separator_block_width":20},\
${endif}
  ${if_up eth0}
   {"full_text" : " eth0: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
   {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":false,"separator_block_width":0, "markup": "pango", "color" : "\#EEEEEC","separator":false,"separator_block_width":5},\
   {"full_text" : "${addr eth0}" , "color" : "\#007CFF" ,"separator":false,"separator_block_width":5},\
   {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":false,"separator_block_width":0, "markup": "pango", "color" : "\#EEEEEC","separator":false,"separator_block_width":5},\
   {"full_text" : "${execi 300 /home/antonio/bin/myip.sh}" , "color" : "\#007CFF" ,"separator":true,"separator_block_width":20},\
${else} 
   {"full_text" : " eth0 unassigned" , "color" : "\#e50000" ,"separator":true,"separator_block_width":20},\
${endif}
   {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":false,"separator_block_width":0, "markup": "pango", "color" : "\#FFFF00","separator":false,"separator_block_width":5},\
  {"full_text" : "Status: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_status " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_smart " , "color" : "\#FFFF00" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "from " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_album " , "color" : "\#FFFF00" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_elapsed / $mpd_length " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "BR: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_bitrate kBs " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "Rdn: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_random " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "Rpt: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "$mpd_repeat " , "color" : "\#007CFF", "separator":false,"separator_block_width":0},\
  {"full_text" : "CF: " , "color" : "\#EEEEEC" ,"separator":false,"separator_block_width":0},\
  {"full_text" : "${execi 3 mpc crossfade | gawk '{print $2}'}" , "color" : "\#007CFF", "separator":false,"separator_block_width":8},\
  {"full_text" : "<span font='Font Awesome 5 Free 11'></span>", "separator":true,"separator_block_width":0, "markup": "pango", "color" : "\#FFFF00","separator":true,"separator_block_width":20},\
  {"full_text" : "", "color" : "\#e50000" ,"separator":true,"separator_block_width":19}\

 ],

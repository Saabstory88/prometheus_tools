Position based:
/set/fix # // One fix = release (not implemented)
/set/fix # # // fix | intensity
/set/fix # # # # # // fix | int | red | g | b
/set/fix # # # # # # // fix | int | r | g | b | white
Parameter-based:
/set/fix/
         int/# #
                 whi/# #
                 rgb/# # # #
                 red/# #
                 grn/# #
                 blu/# #
e.g.: /set/fix/int/3 65535 sets fixture 3 intensity to 100%
/set/load # #// cuestack | fader
/set/loadandgo # # // cuestack | fader
/set/go // fader
load 0 # = clear output
load 1 1 = load custack 1 onto fader 1
go 0 = stop all stacks and clear output
Reboot controller:
/set/reboot 4
(send an integer parameter of 4)
ETC's OSCWidgets wants a slightly different command format: "/set/reboot=4" vs. Qlabs "/set/reboot 4"
If you send a float parameter instead of an integer parameter, it generally works fine.
- UDP 9000
- No OSC feedback at the moment.
- You can broadcast OSC
- TCP support coming soon...
Request welcome.

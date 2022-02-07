setup () 
{ 
  . `ups setup "$@"` 
}
unsetup () 
{ 
  . `ups unsetup "$@"` 
}
unsetup_all () 
{ 
  eval `ups active | sed -e 1d -e "/^ups /d" -e "s/^\([^ ]*\)/echo unsetup -j \1;unsetup -j \1/" -e "s/\(.*\)/\1;/"` 
}

echo "setting up dune"  >/tmp/test_hook.txt
source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh >>/tmp/test_hook.txt

setup () { . `ups setup "$@"` }
unsetup () { . `ups unsetup "$@"` }
unsetup_all () { eval `ups active | sed -e 1d -e "/^ups /d" -e "s/^\([^ ]*\)/echo unsetup -j \1;unsetup -j \1/" -e "s/\(.*\)/\1;/"` }

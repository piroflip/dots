#!/bin/zsh
SESSION=main
tmuxexe="tmux"

# if the session is already running, just attach to it.
$tmuxexe has-session -t $SESSION
if [ $? -eq 0 ]; then
  echo "Session $SESSION already exists. Attaching."
  sleep 1
  $tmuxexe attach -t $SESSION
  exit 0;
fi
# create a new session, named $SESSION, and detach from it
$tmuxexe new-session -d -s $SESSION

$tmuxexe new-window    -t $SESSION:0 -k -n i686     'sudo linux32 chroot /opt/arch32 sudo su piroflip'
$tmuxexe new-window    -t $SESSION:1 -k -n vm       'cd /mnt/disk/devel/fpsu/asyn/access/makefres/x86;mc'
$tmuxexe new-window    -t $SESSION:2 -k -n f32bit   'cd /mnt/disk/devel/fpsu/asyn/access/makefres/x86;mc'
$tmuxexe new-window    -t $SESSION:3 -k -n f64bit   'cd /mnt/disk/devel/fpsu64/asyn/access/makefres/x86;mc'
$tmuxexe new-window    -t $SESSION:4

$tmuxexe select-window -t $SESSION:4
$tmuxexe attach -t $SESSION

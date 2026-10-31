

#!/bin/bash

SESSION="MEDOX_SOC_V3"
DIR="/home/medeni/Documents"

# Pokretanje nove sesije u pozadini
tmux new-session -d -s $SESSION -n "SOC_Center"

# 1. Panel (Gornji levi): Pokretanje SHIELD modula
tmux send-keys -t $SESSION "cd $DIR && sudo ./whitehat_shield.sh" C-m

# Deljenje ekrana vertikalno
tmux split-window -h -t $SESSION

# 2. Panel (Gornji desni): Pokretanje HUNTER modula
tmux send-keys -t $SESSION "cd $DIR && ./whitehat_hunter.sh" C-m

# Selektujemo ponovo levi deo i delimo ga horizontalno za srednji red
tmux select-pane -t 0
tmux split-window -v -t $SESSION

# 3. Panel (Srednji levi): Pokretanje AUDIT-a (Radar sistem)
tmux send-keys -t $SESSION "cd $DIR && ./radar.sh" C-m

# Ponovo delimo donji levi deo za duboke logove
tmux split-window -v -t $SESSION

# 4. Panel (Skroz donji levi): Deep Scan Logs modul
tmux send-keys -t $SESSION "cd $DIR && ./whitehat_deepscan.sh" C-m

# Prelazimo na desnu stranu ekrana i delimo je horizontalno
tmux select-pane -t 4
tmux split-window -v -t $SESSION

# 5. Panel (Srednji desni): Live Mrežni Saobraćaj (Tshark koji smo sad instalirali)
tmux send-keys -t $SESSION "sudo tshark -i any" C-m

# Ponovo delimo desnu stranu za šesti panel na dnu
tmux split-window -v -t $SESSION

# 6. Panel (Skroz donji desni): Tvoj novi ALERT & TCP Reset sistem iz Nim-a
tmux send-keys -t $SESSION "cd /home/medeni && ./live_monitor.sh" C-m

# Otvaranje gotovog i podeljenog SOC prozora pred korisnika
tmux select-window -t $SESSION:"SOC_Center"
tmux attach-session -t $SESSION

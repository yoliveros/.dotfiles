#!/usr/bin/env bash

user=$(logname)

echo ExecStart=/bin/bash /home/$user/.local/bin/themenizer >> ./systemd/themenizer.service

ln -sf /home/$user/.dotfiles/systemd/themenizer.service /etc/systemd/system/themenizer.service
ln -sf /home/$user/.dotfiles/systemd/themenizer.timer /etc/systemd/system/themenizer.timer

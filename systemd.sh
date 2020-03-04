# Reference: https://vic.demuzere.be/articles/using-systemd-user-units/

mkdir -p ~/.config/systemd/user
touch ~/.config/systemd/user/metabase.service

# systemctl --user start metabase
# systemctl --user stop metabase
# systemctl --user restart metabase
# systemctl --user status metabase
# loginctl enable-linger USERNAME
# loginctl user-status USERNAME

[Service]
ExecStart=/usr/bin/env /home/metabase/lib/java/bin/java -DMB_JETTY_PORT=6060 -jar /home/metabase/lib/metabase.jar
RestartSec=10s
Restart=on-failure

[Install]
WantedBy=default.target

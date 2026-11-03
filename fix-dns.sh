#!/bin/bash
set -e

cat > /usr/local/bin/fix-dns.sh <<'EOF'
#!/bin/bash

cat > /etc/resolv.conf <<EOL
nameserver 8.8.8.8
nameserver 1.0.0.1
EOL
EOF

chmod +x /usr/local/bin/fix-dns.sh

cat > /etc/systemd/system/fix-dns.service <<'EOF'
[Unit]
Description=Fix DNS resolver

[Service]
Type=oneshot
ExecStart=/usr/local/bin/fix-dns.sh
EOF

cat > /etc/systemd/system/fix-dns.timer <<'EOF'
[Unit]
Description=fix DNS resolver

[Timer]
OnBootSec=10s
OnUnitActiveSec=5min
Persistent=true

[Install]
WantedBy=timers.target
EOF

systemctl daemon-reload
systemctl enable --now fix-dns.timer
systemctl start fix-dns.service

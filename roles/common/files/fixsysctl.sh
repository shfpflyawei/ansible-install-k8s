#!/bin/bash
cat > /etc/sysctl.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_fin_timeout = 1
net.ipv4.tcp_keepalive_time = 30
net.ipv4.ip_local_port_range = 1024 65000
fs.file-max = 265535
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
vm.swappiness = 0
EOF
sysctl --system
cat >>/etc/security/limits.conf<<EOF
*  soft  core   unlimit 
*  hard  core   unlimit 
*  soft  fsize  unlimited 
   hard  fsize  unlimited 
*  soft  data   unlimited 
*  hard  data   unlimited 
*  soft  nproc  65535 
*  hard  nproc  63535 
*  soft  stack  unlimited 
*  hard  stack  unlimited 
*  soft  nofile  409600 
*  hard  nofile  409600
EOF

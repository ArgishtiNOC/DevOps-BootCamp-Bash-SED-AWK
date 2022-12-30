#!/bin/bash

# Put you code here
awk 'BEGIN {FS = OFS = ":"} {if($1=="saned") {$7="/bin/bash"} print $0}' passwd_new
sed '/^avahi:/s~:/usr/sbin/nologin$~:/bin/bash~' passwd_new
awk 'BEGIN {FS = OFS = ":"} {print $1,$3,$5,$7}' passwd_new
sed -i '/daemon/d' passwd_new
awk 'BEGIN {FS = OFS = ":"} {if($3%2==0) {$7="/bin/zsh"} print $0}' passwd_new

#!/bin/bash

# 添加2.15的公钥到指定服务器

salt '*' cp.get_file salt://jump.pub /tmp/jump.pub
salt '10.102.5.70' cmd.run "cat /tmp/jump.pub >>/root/.ssh/authorized_keys && chmod 700 /root/.ssh/authorized_keys"
salt '*' cmd.run "ls -l /root/.ssh/authorized_keys"
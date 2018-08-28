# 例：
ansible-playbook playbook/test.yml --extra-vars "app_tar_dir=/srv/salt/ovs app_tarname=test12 app_tag=1.1.0 build_id=2.2.2 app_mana=Fales"

<<<<<<< HEAD
# 判断java环境，需要安装jdk
=======
# 服务属主属组
app_user: robot
app_group: robot
host_ip: jump

# 服务名称，路径及软连接路径
app_name: test
app_dir: /data/app
app_src: /data/src_app
app_upflie: /data/upfile

# 服务启停
scripts_path: '{{ app_dir }}/{{ app_name }}'
#scripts_start: None
#scripts_stop: None
scripts_service: service.sh
#app_type: None

# tar包路径及名称
app_tarname: name # tar包的名称，不带.tar.gz
app_tar_dir: /data/jenkins/workspace
tag_id: tag_name # tag名称
build_id: BuildId

# include 模板判断条件
pid_name: zabbix_agentd.conf

<<<<<<< HEAD
ansible-playbook playbook/impala.yml --extra-vars "host_ip=10.102.5.77 app_tar_dir=/data/jenkins/workspace/ucenter-gateway_5.77_5.74/target app_tarname=ucenter-gateway  app_name=Orion_UCenter_Gateway scripts_stop='shutdown.sh' scripts_start='startup-online.sh' build_id=2 pid_name=ucenter-gateway.jar scripts_path=/data/app/Orion_UCenter_Gateway/bin tag_id=v_1.3.9"
=======

ansible-playbook playbook/test.yml --extra-vars "host_ip=172.16.0.12 app_tar_dir=/data/jenkins/workspace \
	app_tarname=semantic-online_nebulae_3.42_3.50 tag_id=master app_name=nebulae scripts_start=start.sh \
	scripts_stop=stop.sh scripts_path=/data/app/nebulae/services \
	build_id=123 pid_name=nebulae_server.py src_conf=conf_test_txy"

sudo salt "jpaws-xiaobao-resource01" cmd.run "ps -ef|grep php-fpm|grep master|grep -v grep|awk '{print \$2}'|xargs kill -USR2" runas='root'
>>>>>>> e462b5e... 添加monit配置

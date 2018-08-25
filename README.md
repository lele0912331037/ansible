# 例：
ansible-playbook playbook/test.yml --extra-vars "app_tar_dir=/srv/salt/ovs app_tarname=test12 app_tag=1.1.0 build_id=2.2.2 app_mana=Fales"

# 判断java环境，需要安装jdk

ansible-playbook playbook/impala.yml --extra-vars 'host_ip=10.102.5.69 app_tar_dir=/data/jenkins/workspace/orion-test_api-impala-agent_5.69_5.70/target 	app_tarname=impala-rest-0.0.1-SNAPSHOT tag_id=v1.0.0 app_name=api-impala-agent     scripts_service=server.sh app_tpye=restart app_service=True build_id=19     app_check=True pid_name=impala-rest-0.0.1-SNAPSHOT'

ansible-playbook playbook/test.yml --extra-vars "host_ip=172.16.0.12 app_tar_dir=/data/jenkins/workspace \
	app_tarname=semantic-online_nebulae_3.42_3.50 tag_id=master app_name=nebulae scripts_start=start.sh \
	scripts_stop=stop.sh scripts_path=/data/app/nebulae/services \
	build_id=43 pid_name=nebulae_server.py src_conf=conf_test_txy"
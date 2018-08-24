# 例：
ansible-playbook playbook/test.yml --extra-vars "app_tar_dir=/srv/salt/ovs app_tarname=test12 app_tag=1.1.0 build_id=2.2.2 app_mana=Fales"

# 判断java环境，需要安装jdk

ansible-playbook playbook/impala.yml --extra-vars 'host_ip=10.102.5.69 app_tar_dir=/data/jenkins/workspace/orion-test_api-impala-agent_5.69_5.70/target 	app_tarname=impala-rest-0.0.1-SNAPSHOT tag_id=v1.0.0 app_name=api-impala-agent     scripts_service=server.sh app_tpye=restart app_service=True build_id=19     app_check=True pid_name=impala-rest-0.0.1-SNAPSHOT'

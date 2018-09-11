# `jdk安装`
## `roles/jdk`
## `参数解释`
* 安装服务ip
    * hosts: 172.16.0.15 # 默认172.16.0.15
* 安装版本
    * jdk_version: 1.7 or 1.8 # 格式固定，默认1.8
* 安装路径
    * jdk_path:/usr/local/{jdk1_7,jdk1_8} # 默认/usr/local/jdk1_8

`其他没啥好解释的 ，具体看roles/jdk/vars/main.yml，支持安装jdk1.7和1.8`

## `example:`
`ansible-playbook playbook/jdk.yml -e \
    "{
        'hosts':'172.16.0.15',
        'jdk_version':'1.7'
    }"`

# `通用更新playbook`
## `roles/update`

## `参数解释`

* 服务信息

    * 服务属主
        * `app_user: robot`
    * 服务属组
        * `app_group: robot`
    * 服务名称，路径及软连接路径
        * `app_name: appname # 必须且唯一`
    * 服务路径
        * `app_dir: /data/app`
    * 服务源路径
        * `app_src: /data/src_app`
    * 包更新路径
        * `app_upflie: /data/upfile`

* 服务启停

    * #启停脚本路径，非项目根路径下需指定此参数
        * `scripts_path: '{{ app_dir }}/{{ app_name }}'`
    * #启动脚本
        * `scripts_start: start.sh/service.sh start  # 必须`
    * #停止脚本
        * `scripts_stop: stop.sh/service.sh stop # 必须`
    * #进程唯一名称
        * `pid_name: pidname # 必须且唯一`


* 压缩包信息

    * 压缩包路径
        * `app_tar_dir: /data/jenkins/workspace`
    * 压缩包名称，不带后缀
        * `app_tarname: name # 必须`
    * 压缩包类型，默认tag.gz
        * `cut_type: tar.gz`
    * git地址的tag名称
        * `tag_id: tag_name # 必须`
    * jenkins构建的ID
        * `build_id: BuildId`


* 其他特殊相关

    * #配置文件更改
        * `src_conf: srcconf`
        * `dest_conf:conf`

## `使用example：`

`ansible-playbook playbook/update.yml -e \
    "{
        'host_ip':'${i}',
        'app_tarname':'${JOB_NAME}',
        'tag_id':'${tag}',
        'app_name':'nebulae',
        'scripts_start':'start.sh',
        'scripts_stop':'stop.sh',
        'scripts_path':'/data/app/nebulae/services',
        'build_id':'${BUILD_ID}',
        'pid_name':'nebulae_server.py',
        'src_conf':'${src_conf}'
    }"`
# leanotedocker

用Docker部署leanote。

## 镜像构建

下载leanote二进制包并解压到`./leanote`下

```
docker build -t leanote:version .
```

或者直接使用预构建的镜像（以v2.6.1为例)：

```
docker pull raptor/leanote:v2.6.1
```

## 启动服务

### 修改配置

修改配置文件`app.conf`，其中`db.host`已改为`mongodb`，还需要修改`app.secret`为你自己的值。

修改`docker-compose.yml`，将`mongodb`的数据保存路径和`app.conf`的路径改为你的实际路径。

### 初始化数据

注意，下面的`mongodb`数据保存路径和`leanote`初始化数据路径要改为你的实际路径。

```
docker run -d -v ~/mongo_data:/data --name=mongodb mongo:4.2
docker run -it --rm -v ~/leanote/mongodb_backup/leanote_install_data:/root/initdata --link=mongodb --entrypoint="" mongo:4.2 mongorestore -h mongodb -d leanote --dir /root/initdata/
docker rm -f mongodb
```

### 启动服务

```
docker-compose up -d
```

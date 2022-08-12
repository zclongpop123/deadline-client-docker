Deadline Client Docker
--
 - 克隆仓库
```bash
git clone https://github.com/zclongpop123/deadline-client-docker.git
```
- 构建镜像
```bash
docker build -t deadline-client:10.1 .
```
- 运行 Web Service
```bash
docker run --name DeadlineWebService -d -v /opt/Thinkbox/DeadlineRepository10:/mnt/DeadlineRepository10 -p 8081:8081 deadline-client:10.1 ./deadlinewebservice
```

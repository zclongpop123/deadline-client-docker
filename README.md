How To Use
==
 - Clone this Repo
```
git clone https://github.com/zclongpop123/deadline-client-docker.git
```
- Copy Deadline installer to this dir

- Build image
```
docker build -t deadline-client .
```
- Run Webservice
```
docker run -v /opt/Thinkbox/DeadlineRepository10:/mnt/DeadlineRepository10 -p 8081:8081 deadline-client ./deadlinewebservice
```

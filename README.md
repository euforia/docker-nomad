
```
docker run -v /var/run/docker.sock:/var/run/docker.sock \
    --net=host --restart always \
    euforia/nomad ...
```

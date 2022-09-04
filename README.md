
# Build image

```
sudo docker build . -t nginx-harden
```
Change tag of the image
```
sudo docker tag nginx-harden 10.1.5.10:10100/nginx-harden
```
Push the image into the Nexus server
```
sudo docker image push 10.1.5.10:10100/nginx-harden
```

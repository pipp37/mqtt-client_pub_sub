[![](https://images.microbadger.com/badges/image/pipp37/mqtt-client_pub_sub.svg)](https://microbadger.com/images/pipp37/mqtt-client_pub_sub "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/pipp37/mqtt-client_pub_sub.svg)](https://microbadger.com/images/pipp37/mqtt-client_pub_sub "Get your own version badge on microbadger.com")


# mqtt-client_pub_sub docker container
Docker container with command line mosquitto_sub and mosquitto_pub

Use this container to get a mqtt-publish and mqtt-subscribe commandline from the mosquitto-client.

#### Subscribe to all topics of an mqtt-broker
```docker run -it --rm pipp37/mqtt-client_pub_sub sub -h 192.168.20.99 -d -v -t \# ```
#### Subscribe to the public HiveMQ broker and listen to all topics at devices
```docker run -it --rm pipp37/mqtt-client_pub_sub sub -h broker.hivemq.com  -d -v -t devices/\# ```
  
#### Publish a message to a mqtt-broker
```docker run -it --rm pipp37/mqtt-client_pub_sub pub -h 192.168.20.99 -d -t devices/myswitch -m "on"```
  
#### Make mosquitto_pub and mosquitto_sub in /usr/local/bin
Installing the bash scripts mosquitto_pub and mosquitto_sub from the containers script directory makes the commands available.
```
docker run --rm pipp37/mqtt-client_pub_sub /bin/cat /scripts/mosquitto_sub > /usr/local/bin/mosquitto_sub
docker run --rm pipp37/mqtt-client_pub_sub /bin/cat /scripts/mosquitto_pub > /usr/local/bin/mosquitto_pub
chmod +x /usr/local/bin/mosquitto_* 
```

#### Now the same syntax of the original mosquitto-client is usable.
```
mosquitto_pub -h 192.168.20.99 -d -t devices/myswitch -m "on"
mosquitto_sub -h broker.hivemq.com  -d -v -t devices/\# 

mosquitto_pub --help
mosquitto_sub --help

```


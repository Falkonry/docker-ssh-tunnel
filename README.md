# Docker SSH Tunnel

Alpine Linux based SSH tunnel packaged as a container image

### Required Parameters
```bash
# local port on your machine/k8s cluster
LOCAL_PORT=3306

# remote port from the machine your SSHing into
REMOTE_PORT=3306

# OPTIONAL defaults to 127.0.0.1
REMOTE_SERVER_IP="my.internal.mariadb.server"

# the bastion/host you're connecting to
SSH_BASTION_HOST="bastion.host"

# OPTIONAL defaults to 22
SSH_PORT=2297

SSH_USER="tunnel_user"
```

Also be sure to inject/mount your private ssh key into the container to `/ssh_key/id_rsa`

### Example

```bash
# connect to our mongo server in AWS via a bastion host
# now we can use a connection string like this:
# mongodb://localhost:27017 
# to talk to our AWS mongo install

docker run -it --rm -p 27017:27017 \
-e LOCAL_PORT=27017 \
-e REMOTE_PORT=27017 \
-e SSH_BASTION_HOST=34.135.248.162 \
-e REMOTE_SERVER_IP=aws-nlb-mongo-fake.internal-us-east-1.es.amazonaws.com \
-e SSH_USER=ec2-user \
-v ~/.ssh/id_rsa:/ssh_key/id_rsa:ro \
jujhars13/docker-ssh-tunnel

# connection established, now we can mongo away locally
mongo --host localhost --port 27017
```

## TODO

- [x] add example `docker-compose.yml`  to `/examples`
- [ ] add example k8s manifest to `/examples`

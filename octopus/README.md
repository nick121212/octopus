# 安装etcd

apt-get update  #更新系统 
apt-get upgrade  #升级系统 
apt-get install wget  gcc make#安装wget、gcc、make


docker stop etcd && docker rm etcd
CERT_DIR=/etc/ssl/certs
DISCOVERY_PATH="https://discovery.etcd.io/69af2be73aa8fee9a7ad2241bcb87001"

export HostIP="192.168.99.110"
sudo docker run -d -v $CERT_DIR:$CERT_DIR -v /var/etcd/etcd -p 4001:4001 -p 2380:2380 -p 2379:2379 \
 --name etcd ystyle/etcd \
 --name etcd1 \
 --data-dir /etcd/etcd1.etcd \
 --advertise-client-urls http://${HostIP}:2379,http://${HostIP}:4001 \
 --listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 --initial-advertise-peer-urls http://${HostIP}:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --initial-cluster-token etcd-cluster-1 \
 --initial-cluster-state new \
 --discovery $DISCOVERY_PATH

export HostIP="192.168.99.111"
docker run -d -v $CERT_DIR:$CERT_DIR -v /var/etcd/etcd -p 4001:4001 -p 2380:2380 -p 2379:2379 \
 --name etcd ystyle/etcd \
 --name etcd2 \
 --data-dir /etcd/etcd2.etcd \
 --advertise-client-urls http://${HostIP}:2379,http://${HostIP}:4001 \
 --listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 --initial-advertise-peer-urls http://${HostIP}:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --initial-cluster-token etcd-cluster-2 \
 --initial-cluster-state new \
 --discovery $DISCOVERY_PATH
 
 
export HostIP="192.168.99.112"
docker run -d -v $CERT_DIR:$CERT_DIR -v /var/etcd/etcd -p 4001:4001 -p 2380:2380 -p 2379:2379 \
 --name etcd ystyle/etcd \
 --name etcd3 \
 --data-dir /etcd/etcd3.etcd \
 --advertise-client-urls http://${HostIP}:2379,http://${HostIP}:4001 \
 --listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 --initial-advertise-peer-urls http://${HostIP}:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --initial-cluster-token etcd-cluster-3 \
 --initial-cluster-state new \
 --discovery $DISCOVERY_PATH
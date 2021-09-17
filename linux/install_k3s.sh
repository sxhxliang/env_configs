

apt install docker-ce docker-ce-cli containerd.io






kubeadm reset -f
modprobe -r ipip
lsmod
sudo rm -rf ~/.kube/
sudo rm -rf /etc/kubernetes/
sudo rm -rf /etc/systemd/system/kubelet.service.d
sudo rm -rf /etc/systemd/system/kubelet.service
sudo rm -rf /usr/bin/kube*
sudo rm -rf /etc/cni
sudo rm -rf /opt/cni
sudo rm -rf /var/lib/etcd
sudo rm -rf /var/etcd


sudo rm -rf /usr/bin/ctr
sudo rm -rf /usr/local/bin/kubectl
sudo rm -rf /usr/local/bin/crictl
sudo rm -rf /usr/local/bin/ctr
sudo rm -rf /usr/local/bin/k3s-killall.sh
sudo rm -rf /usr/local/bin/k3s-agent-uninstall.sh

# echo -e "192.168.1.164\tubuntu" | sudo tee -a /etc/hosts
echo -e "192.168.1.93\taiserver-system-product-name" | sudo tee -a /etc/hosts
echo -e "192.168.1.164\tubuntu" | sudo tee -a /etc/hosts


# install master



curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -

# (base) ubuntu@ubuntu:~$ curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -
# [INFO]  Finding release for channel stable
# [INFO]  Using v1.20.4+k3s1 as release
# [INFO]  Downloading hash http://rancher-mirror.cnrancher.com/k3s/v1.20.4-k3s1/sha256sum-amd64.txt
# [INFO]  Skipping binary downloaded, installed k3s matches hash
# [INFO]  Skipping /usr/local/bin/kubectl symlink to k3s, command exists in PATH at /usr/bin/kubectl
# [INFO]  Skipping /usr/local/bin/crictl symlink to k3s, command exists in PATH at /usr/bin/crictl
# [INFO]  Skipping /usr/local/bin/ctr symlink to k3s, command exists in PATH at /usr/bin/ctr
# [INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
# [INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
# [INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
# [INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
# [INFO]  systemd: Enabling k3s unit
# [INFO]  systemd: Starting k3s
# (base) ubuntu@ubuntu:~$ sudo cat /var/lib/rancher/k3s/server/node-token
# K10112875d41507b0c779dacf7930ce5bdd19362853fdccabceda13bf969ed0909d::server:d94c576e3083ccd829e7f5e802ea5f48


# install slave
# K1084cfab740b03056eaebbebc6cbb373b7ef002cb0778d1545ba1f0bcd1bf998ba::server:62bf9d345ded527ba4e57b9f9bcd55af
curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://192.168.1.164:6443 K3S_TOKEN=K1084cfab740b03056eaebbebc6cbb373b7ef002cb0778d1545ba1f0bcd1bf998ba::server:62bf9d345ded527ba4e57b9f9bcd55af sh -
curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://192.168.1.164:6443 K3S_TOKEN=K1084cfab740b03056eaebbebc6cbb373b7ef002cb0778d1545ba1f0bcd1bf998ba::server:62bf9d345ded527ba4e57b9f9bcd55af sh -
curl -sfL https://docs.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://主节点IP地址:6443 K3S_TOKEN=主节点的token sh -


curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://192.168.1.164:6443 K3S_TOKEN=K1084cfab740b03056eaebbebc6cbb373b7ef002cb0778d1545ba1f0bcd1bf998ba::server:62bf9d345ded527ba4e57b9f9bcd55af sh -


# aiserver@aiserver-System-Product-Name:~$ curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://192.168.1.164:6443 K3S_TOKEN=K10112875d41507b0c779dacf7930ce5bdd19362853fdccabceda13bf969ed0909d::server:d94c576e3083ccd829e7f5e802ea5f48 sh -
# [sudo] aiserver 的密码：
# [INFO]  Finding release for channel stable
# [INFO]  Using v1.20.4+k3s1 as release
# [INFO]  Downloading hash http://rancher-mirror.cnrancher.com/k3s/v1.20.4-k3s1/sha256sum-amd64.txt
# [INFO]  Downloading binary http://rancher-mirror.cnrancher.com/k3s/v1.20.4-k3s1/k3s
# [INFO]  Verifying binary download
# [INFO]  Installing k3s to /usr/local/bin/k3s
# [INFO]  Creating /usr/local/bin/kubectl symlink to k3s
# [INFO]  Creating /usr/local/bin/crictl symlink to k3s
# [INFO]  Skipping /usr/local/bin/ctr symlink to k3s, command exists in PATH at /usr/bin/ctr
# [INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
# [INFO]  Creating uninstall script /usr/local/bin/k3s-agent-uninstall.sh
# [INFO]  env: Creating environment file /etc/systemd/system/k3s-agent.service.env
# [INFO]  systemd: Creating service file /etc/systemd/system/k3s-agent.service
# [INFO]  systemd: Enabling k3s-agent unit
# [INFO]  systemd: Starting k3s-agent
# aiserver@aiserver-System-Product-Name:~$

# https://blog.csdn.net/varyuan/article/details/111877987
sudo kubectl label node aiserver-system-product-name  node-role.kubernetes.io/worker=worker

# (base) ubuntu@ubuntu:~/workshop/k8s$ sudo kubectl get nodes
# NAME                           STATUS     ROLES                  AGE   VERSION
# aiserver-system-product-name   NotReady   <none>                 73m   v1.20.4+k3s1
# ubuntu                         Ready      control-plane,master   93m   v1.20.4+k3s1
# (base) ubuntu@ubuntu:~/workshop/k8s$ sudo kubectl get nodes
# NAME                           STATUS   ROLES                  AGE   VERSION
# ubuntu                         Ready    control-plane,master   94m   v1.20.4+k3s1
# aiserver-system-product-name   Ready    <none>                 74m   v1.20.4+k3s1
# (base) ubuntu@ubuntu:~/workshop/k8s$ kubectl label node ${node_name} node-role.kubernetes.io/worker=worker
# WARN[2021-03-15T12:20:52.291032714+08:00] Unable to read /etc/rancher/k3s/k3s.yaml, please start server with --write-kubeconfig-mode to modify kube config permissions
# error: error loading config file "/etc/rancher/k3s/k3s.yaml": open /etc/rancher/k3s/k3s.yaml: permission denied
# (base) ubuntu@ubuntu:~/workshop/k8s$ sudo kubectl label node ${node_name} node-role.kubernetes.io/worker=worker
# error: resource(s) were provided, but no name, label selector, or --all flag specified
# (base) ubuntu@ubuntu:~/workshop/k8s$ sudo kubectl label node aiserver-system-product-name  node-role.kubernetes.io/worker=worker
# node/aiserver-system-product-name labeled
# (base) ubuntu@ubuntu:~/workshop/k8s$ sudo kubectl get nodes
# NAME                           STATUS   ROLES                  AGE   VERSION
# ubuntu                         Ready    control-plane,master   96m   v1.20.4+k3s1
# aiserver-system-product-name   Ready    worker                 76m   v1.20.4+k3s1
# (base) ubuntu@ubuntu:~/workshop/k8s$
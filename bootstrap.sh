#!/usr/bin/env bash

apt-get update
apt-get install -y curl

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

apt-get update
apt-get install -y git \
	apt-transport-https \
	ca-certificates \
	google-cloud-sdk \
	kubectl \
	openjdk-11-jdk
	
curl -L "https://github.com/jenkins-x/jx/releases/download/$(curl --silent "https://github.com/jenkins-x/jx/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')/jx-linux-amd64.tar.gz" | tar xzv "jx"
mv jx /usr/local/bin/
	
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> /home/vagrant/.bashrc

git clone https://github.com/DevOpsCamp2019/environment-deliverymachine-one-dev.git /home/vagrant/repos/delivermachine-dev
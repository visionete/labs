# Install JAVA
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y openjdk-11-jdk

# Install Jenkins
wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install -y jenkins

# Install Maven  ( on Jenkins machine )
cd /tmp
wget https://ftp.heanet.ie/mirrors/www.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar xzf apache-maven-3.6.3-bin.tar.gz -C /opt

# Set JAVA_HOME & MAVEN_HOME as environment variables on Jenkins machine
cd /etc
echo 'MAVEN_HOME="/opt/apache-maven-3.6.3"' >> profile
echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> profile
echo 'PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH' >> profile
. profile

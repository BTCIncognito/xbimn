#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*      BTCi Masternode        *"
echo "*           SETUP             *"
echo "*            BY               *"
echo "*         CryptoBat           *"
echo "*                             *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IP==$(curl -s4 icanhazip.com)
echo -e "${GREEN}Please enter your private key: (Right click and press enter)${NC}" 
read KEY
sleep 2
echo ""
echo ""
echo -e "${RED}PLEASE KEEP YOUR HANDS AND FEET INSIDE THE RIDE AT ALL TIMES!${NC}"
sleep 5

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano unrar unzip -y
sudo apt-get install libboost-all-dev libevent-dev software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sleep 2
echo -e "${GREEN}Downloading more ram!${NC}"
sleep 5 
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd
sleep 2
echo -e "${GREEN}Keeping out all the ${RED}HAXORZ!${NC}"
sleep 5
sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 7250/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sleep 2
echo ""
echo ""
echo -e "${GREEN}Moving stuff where it ${RED}NEEDS to be${NC}"
sudo chmod +x /root/btcimn/btcid /root/btcimn/btci-cli
sudo mv /root/btcimn/btcid /root/btcimn/btci-cli /usr/local/bin
echo ""
echo ""
sleep 2
echo -e "${GREEN}Creating the ${RED}Configuration File Now${NC}"
sleep 2
sudo mkdir /root/.BTCi
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /root/.BTCi/btci.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /root/.BTCi/btci.conf
echo "rpcallowip=127.0.0.1" >> /root/.BTCi/btci.conf
echo "listen=1" >> /root/.BTCi/btci.conf
echo "server=1" >> /root/.BTCi/btci.conf
echo "daemon=1" >> /root/.BTCi/btci.conf
echo "maxconnections=250" >> /root/.BTCi/btci.conf
echo "masternode=1" >> /root/.BTCi/btci.conf
echo "masternodeaddr$IP:7250" >> /root/.BTCi/btci.conf
echo "externalip$IP:7250" >> /root/.BTCi/btci.conf
echo "masternodeprivkey=$KEY" >> /root/.BTCi/btci.conf
echo -e "${GREEN}STARTING THE DAEMON${NC}"
cd /root
sudo btcid
sleep 2
echo ""
echo ""
echo -e "Thank you for installing BTCi.  Please move onto the ${RED}NEXT${NC} step."

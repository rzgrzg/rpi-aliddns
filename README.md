# rpi-aliddns
aliddns(阿里云解析) dockerfile written in Golang for rpi

#source
chenhw2/aliyun-ddns-cli (https://github.com/chenhw2/aliyun-ddns-cli)

usage:

docker build -t rzgrzg/aliddns https://github.com/rzgrzg/rpi-aliddns.git

docker run --restart=always --name aliddns -d \  
    -e "AKID=ALIYUN's AccessKey-ID" \  
    -e "AKSCT=ALIYUN's AccessKey-Secret" \  
    -e "DOMAIN=ddns.aliyun.win" \    
    -e "REDO=600" \    
    rzgrzg/aliddns

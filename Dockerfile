# Pull base image.
FROM hypriot/rpi-alpine-scratch
LABEL MAINTAINER CHENHW2 <https://github.com/chenhw2>
#Unpack and install aliddns
RUN apk update && apk add wget
RUN mkdir /usr/local/aliddns
RUN wget -SL --no-check-certificate https://github.com/chenhw2/aliyun-ddns-cli/releases/download/v20180510/aliddns_arm-64e42d3.tar.gz && \
 tar -zxvf aliddns_arm-64e42d3.tar.gz ./aliddns_arm7 -C /usr/local/aliddns && rm aliddns_arm-64e42d3.tar.gz

ENV AKID=1234567890 \
    AKSCT=abcdefghijklmn \
    DOMAIN=ddns.example.win \
    IPAPI=[IPAPI-GROUP] \
    REDO=600
# Define working directory
WORKDIR /usr/local/aliddns
CMD ./aliddns_arm7 \
    --id ${AKID} \
    --secret ${AKSCT} \
    --ipapi ${IPAPI} \
    auto-update \
    --domain ${DOMAIN} \
    --redo ${REDO}

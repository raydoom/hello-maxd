#! /bin/bash

DOMAIN=localhost.localdomain
IP=
DATE=36500

## generate CA : cakey.pem && cacerts.pem
if [[ ! -e "cacerts.pem" || ! -e "cakey.pem" ]]
then
  openssl genrsa -out cakey.pem 2048
  openssl req -x509 -new -nodes -key cakey.pem -subj "/CN=localhost" -days ${DATE} -out cacerts.pem 
fi


## generate server tls
mkdir ${DOMAIN}
openssl genrsa -out ${DOMAIN}/tls.key 2048

cat > ${DOMAIN}/csr.conf << EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn
[ dn ]
C = CN
ST = BJ
L = BJ
O = localhost
OU = localhost
CN = ${DOMAIN}
EOF
cat >> ${DOMAIN}/csr.conf << EOF
[ v3_ext ]
authorityKeyIdentifier=keyid,issuer:always
basicConstraints=CA:FALSE
keyUsage=keyEncipherment,dataEncipherment
extendedKeyUsage=serverAuth,clientAuth
EOF


# 
openssl req -new -key ${DOMAIN}/tls.key -out ${DOMAIN}/tls.csr -config ${DOMAIN}/csr.conf

#
openssl x509 -req -in ${DOMAIN}/tls.csr -CA cacerts.pem  -CAkey cakey.pem \
  -CAcreateserial -out ${DOMAIN}/tls.crt -days ${DATE} \
  -extensions v3_ext -extfile ${DOMAIN}/csr.conf

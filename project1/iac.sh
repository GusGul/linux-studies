#!/bin/bash

echo "Configurando ambiente inicial..."

echo "Removendo usuários existentes..."
userdel -r carlos
userdel -r debora
userdel -r josefina
userdel -r maria
userdel -r sebastiana
userdel -r amanda
userdel -r joao_
userdel -r roberto
userdel -r rogerio

echo "Removendo grupos existentes..."
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Removendo diretórios existentes..."
rm -rf /publico /adm /ven /sec

echo "Criando diretórios..."
mkdir /publico /adm /ven /sec

echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."
useradd -m -G GRP_ADM carlos
useradd -m -G GRP_ADM debora
useradd -m -G GRP_ADM josefina
useradd -m -G GRP_VEN maria
useradd -m -G GRP_VEN sebastiana
useradd -m -G GRP_SEC amanda
useradd -m -G GRP_SEC joao_
useradd -m -G GRP_SEC roberto
useradd -m -G GRP_SEC rogerio

echo "Usuários e grupos criados com sucesso!"
chown root:root /publico /adm /ven /sec
chmod 777 /publico
chmod 770 /adm /ven /sec

echo "Definindo permissões específicas para cada diretório..."
chown :GRP_ADM /adm
chown :GRP_VEN /ven
chown :GRP_SEC /sec

echo "Permissões definidas com sucesso!"
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Configuração do ambiente finalizada!"
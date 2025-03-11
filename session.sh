#!/usr/bin/env bash
echo "Configuracion sesiones centralizadas de HAProxy"

#Elimiando todas las aplicaciones Java.
killall java

# Creando una copia del archivo actual.
if [ ! -e "/etc/haproxy/haproxy.cfg.original" ]; then
  echo "Creando archivo de backup"
  sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original
fi

# Reinicando el servicio de HAProxy
sudo service haproxy stop && sudo service haproxy start

cd ~/practica6-aux

# subiendo las instancias de las aplicaciones
docker compose build
docker compose up

echo "Completando ambiente Sesiones Centralizadas"
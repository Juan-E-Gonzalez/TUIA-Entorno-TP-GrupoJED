FROM ubuntu

RUN apt-get update && apt-get install -y git wget zip imagemagick
RUN mkdir -p /home/TPentorno

WORKDIR /home/TPentorno

COPY . .

RUN chmod +rwx generar.sh descargar.sh procesar.sh comprimir.sh menu.sh

CMD ["bash", "/home/TPentorno/menu.sh"]
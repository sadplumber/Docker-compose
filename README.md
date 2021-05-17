# Docker-compose

пока не смог победить проблему: 
При конфигурировании приложения RUN flask db upgrade
Требуется наличие соединения с Постгресом

А зависимости в docker-compose не работают на этапе build

И docker-compose начинает сначала собирать, потом запускать

Поэтому при первой сборке
docker-compose up app-postgres -d
docker-compose up app-test -d --build




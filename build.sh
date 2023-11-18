set -e

TAG=latest

docker build --tag wtfloris/hestia-bot:$TAG -f Dockerfile.bot .
docker build --tag wtfloris/hestia-scraper:$TAG -f Dockerfile.scraper .

read -p "Run the containers? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker compose down --remove-orphans
    docker compose up -d
fi

set -e

TAG=latest

if [[ $1 == dev ]]; then
        TAG=dev
        DEVARGS='-f docker-compose-dev.yml'
fi

docker build --tag wtfloris/hestia-bot:$TAG -f Dockerfile.bot .
docker build --tag wtfloris/hestia-scraper:$TAG -f Dockerfile.scraper .

if [[ $1 == -y ]] || [[ $2 == -y ]]; then
        docker compose $DEVARGS up -d
        exit
fi

read -p "Run the containers? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
        docker compose up -d
fi

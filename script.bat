echo "Gerando imagens..."

docker build -t bzrr0/projeto-backend:1.0 backend/.
docker build -t bzrr0/projeto-database:1.0 database/.

echo "Efetuando push de imagens..."

docker push bzrr0/projeto-backend:1.0
docker push bzrr0/projeto-database:1.0

echo "Criando processos no cluster..."

kubectl apply -f ./services.yml

echo "Realizando deployments..."

kubectl apply -f ./deployment.yml

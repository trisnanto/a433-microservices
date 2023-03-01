#membuat Docker image dari Dockerfile
docker build -t karsajobs-ui:latest .

#mengubah nama image sesuai dengan format Github Packages
docker tag karsajobs-ui:latest ghcr.io/trisnanto/karsajobs-ui:latest

#login ke Github Packages
echo $CR_PAT | docker login ghcr.io -u trisnanto --password-stdin

#mengunggah image ke Github Packages
docker push ghcr.io/trisnanto/karsajobs-ui:latest

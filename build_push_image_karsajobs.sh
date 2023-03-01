#membuat Docker image dari Dockerfile
docker build -t karsajobs:latest .

#mengubah nama image sesuai dengan format Github Packages
docker tag karsajobs:latest ghcr.io/trisnanto/karsajobs:latest

#login ke Github Packages
echo $CR_PAT | docker login ghcr.io -u trisnanto --password-stdin

#mengunggah image ke Github Packages
docker push ghcr.io/trisnanto/karsajobs:latest

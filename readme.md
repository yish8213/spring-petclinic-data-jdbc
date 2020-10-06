# Spring PetClinic + Gradle + K8s

디렉토리 및 파일 설명

/manifests : K8s 레시피 - MySQL, PetClinic, Nginx-ingress  
build.sh : 빌드 스크립트(check-env.sh 스크립트 실행을 위해 mysqladmin이 필요하다)  
deploy.sh : 도커이미지 디플로이

# 배포 방법

MySQL -> PetClinic -> Nginx-ingress 순서로 배포를 진행한다.

`kubectl apply -f mysql-0-pv.yaml`  
`kubectl apply -f mysql-1-deployment.yaml`

배포후 mysql 팟이 생성되면 계정 ACL 설정과 스키마 생성을 진행한다.

`kubectl exec -it <mysql_podname> -- /bin/bash`  
`mysql -uroot -p`

패스워드는 프로퍼티 파일을 참고..

`CREATE DATABASE petclinic;`  
`GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.42.0.%' IDENTIFIED BY 'petclinic' WITH GRANT OPTION;`  
IP 대역은 K8s 클러스터 IP범위를 참고하여 설정한다.  
`FLUSH PRIVILEGES;`

`kubectl apply -f petclinic-0-deployment.yaml`  
wro4j 플러그인을 Gradle에 설정하는 대신 static/resources에 petclinic.css 파일로 대체 하였다.

`kubectl apply -f nginx-ingress-0-deployment.yaml`  
싱글 노드라면 해당 노드의 IP에 80포트로 PetClinic에 접근 가능하다.


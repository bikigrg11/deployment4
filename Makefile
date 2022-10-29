PROJECT_ID = devops-directive-traversery-bgurung
run-local:
	docker-compose up --build

create-tf-backend-bucket:
	aws s3 mb s3://$(PROJECT_ID)-terraform

terraform init:
	cd terraform && \ terraform init

terraform plan:
	cd terraform && \ terraform plan

terraform apply:
	cd terraform && \ terraform apply
# Create Amazon ECR repository to store Docker image
resource "aws_ecrpublic_repository" "ecr_repo" {
  repository_name = var.ecr_repo_name
}
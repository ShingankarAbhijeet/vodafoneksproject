resource "aws_ecr_repository" "example-registry" {
  name = "myapp-dev"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
  encryption_type = "KMS"
  }
}

resource "aws_ecr_lifecycle_policy" "example" {
  repository = aws_ecr_repository.example_registry.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
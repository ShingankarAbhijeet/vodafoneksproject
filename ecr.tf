resource "aws_ecr_repository" "examplereg" {
  for_each = toset(var.env)
  name = "${var.Project}/${each.value}"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
  encryption_type = "KMS"
  }
}

resource "aws_ecr_lifecycle_policy" "example" {
  for_each = aws_ecr_repository.examplereg
  repository = each.value.name

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
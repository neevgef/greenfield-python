
# ECS Task Execution Role

resource "aws_iam_role" "ecs_execution" {
  name                 = "exam-ecsTaskExecutionRole"
  permissions_boundary = var.permissions_boundary

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution" {
  role = aws_iam_role.ecs_execution.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Task Role

resource "aws_iam_role" "ecs_task" {
  name                 = "exam-GreenfieldTaskRole"
  permissions_boundary = var.permissions_boundary

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# GitHub Actions OIDC Provider

data "aws_caller_identity" "current" {}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  # Thumbprint is no longer required for this provider
  # when using current AWS IAM OIDC support.
}

# GitHub Actions Deployment Role

resource "aws_iam_role" "github_actions" {
  name                 = "exam-github-actions"
  permissions_boundary = var.permissions_boundary

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "ecr:PutImage",
                "ecr:CreateRepository",
                "ecr:TagResource",
                "ecr:UntagResource"
            ],
            "Resource": [
                "arn:aws:ecr:eu-west-2:030454160336:repository/image-registry"
            ]
        },
        {
            "Sid": "Statement2",
            "Effect": "Allow",
            "Action": [
                "ecs:RegisterContainerInstance",
                "ecs:UpdateContainerAgent",
                "ecs:RunTask",
                "ecs:StartTask",
                "ecs:StopTask"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
    })
}

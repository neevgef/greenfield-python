resource "aws_ecs_task_definition" "greenfield" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu    = "256"
  memory = "512"

  execution_role_arn = aws_iam_role.ecs_execution.arn
  task_role_arn      = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name      = "greenfield-python"
      image     = "${aws_ecr_repository.greenfield.repository_url}:${var.app_version}"
      essential = true

      portMappings = [{
        containerPort = var.container_port
        protocol      = "tcp"
        appProtocol   = "http"
      }]
    }
  ])
}
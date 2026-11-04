variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "greenfield-python"
}

variable "permissions_boundary" {
  description = "Required IAM permissions boundary"
  type        = string
  default     = "arn:aws:iam::030454160336:policy/candidate-exam-boundary"
}

variable "github_repository" {
  description = "GitHub repository in owner/repo format"
  type        = string
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "app_version" {
  description = "Initial Docker image version"
  type        = string
  default     = "1.0.0"
}
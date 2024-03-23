  variable "sai-kumar" {
   description = "IAM usernames"
   type        = list(string)
   default     = ["user1", "user2", "your"]
 }
 resource "aws_iam_user" "example" {
   count = length(var.sai-kumar)
   name  = var.sai-kumar[count.index]
 }



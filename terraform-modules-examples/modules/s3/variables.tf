variable "bucket" {
  description = "Bucket name (optional). If empty a name will be generated."
  type        = string
  default     = ""
}


variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {}
}

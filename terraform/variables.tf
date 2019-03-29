variable "master_db_ip" {
  type    = "string"
  default = "10.132.1.1/24"
}

variable "slave1_db_ip" {
  type    = "string"
  default = "10.132.1.2/24"
}

variable "slave2_db_ip" {
  type    = "string"
  default = "10.132.1.3/24"
}

variable "haproxy_internal_ip" {
  type    = "string"
  default = "10.132.1.10/24"
}

variable "haproxy_external_ip" {
  type    = "string"
  default = "35.250.111.24/24"
}

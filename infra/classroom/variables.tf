variable "students" {
  type    = map
  default = {
    kaam004 = {
      email = "kaam004@feide.egms.no"
    },
    glenn = {
      email = "glenn.bech@gmail.com"
    }
  }
}

variable "classroom_name" {
  description = "the name of the classroom"
  default = "pgr301-05-cd"
}

variable "region" {
  type    = string
  default = "eu-north-1"
}
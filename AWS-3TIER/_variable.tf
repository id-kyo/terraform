######################
### VPC CIDR Block ###
######################
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC_Cidr Block"
  type        = string
}

#################################################
### Categoria de apresentação do CIRD Block 2 ###
#################################################

variable "public_web_subnet_1_cidr" {
  default     = "10.0.1.0/24"
  description = "public_web_subnet1"
  type        = string
}

#################################################
### Categoria de apresentação do CIRD Block 2 ###
#################################################

variable "public_web_subnet_2_cidr" {
  default     = "10.0.2.0/24"
  description = "public_web_subnet2"
  type        = string
}

#################################################
######## Categoria de APP do CIRD Block 1 #######
#################################################

variable "private_app_subnet_1_cidr" {
  default     = "10.0.3.0/24"
  description = "private_app_subnet1"
  type        = string
}

#################################################
######## Categoria de APP do CIRD Block 2 #######
#################################################

variable "private_app_subnet_2_cidr" {
  default     = "10.0.4.0/24"
  description = "private_app_subnet2"
  type        = string
}

#################################################
###### Categoria de Database do CIRD Block 1 ####
#################################################

variable "private_db_subnet_1_cidr" {
  default     = "10.0.5.0/24"
  description = "private_db_subnet2"
  type        = string
}

#################################################
##### Categoria de Database do CIRD Block 2 #####
#################################################

variable "private_db_subnet_2_cidr" {
  default     = "10.0.6.0/24"
  description = "private_db_subnet2"
  type        = string
}

########################################
##### Categoria de APP -- Segurança ####
########################################

variable "ssh_locate" {
  default     = "0.0.0.0/0"
  description = "ip address"
  type        = string
}

#####################################
######## Instância do BD ############
#####################################

variable "database_instance_class" {
  default     = "db.t2.micro"
  description = "o tipo de instância da database"
  type        = string
}

#####################################
########## Multi-AZ #################
#####################################

variable "multi_az_deployment" {
  default     = true
  description = "ativação do multi-az"
  type        = bool
}
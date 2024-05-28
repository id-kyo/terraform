#########################
### LOAD BALANCER DNS ###
#########################

output "lb_dns_name" { #esse dns vai ser usado para dar request nas instâncias públicas
    description = "DNS do load balancer"
    value = "${aws_lb.application-load-balancer.dns_name}"  
}
provider "aws" {
  region = "us-west-2"
}

# create ecr

module "ecr" {
    source = "./modules/ecr"
    ecr_name   = "ecr"
    mutability = "MUTABLE"



    # image_scanning_configuration {
    #     scan_on_push = true
    # }
  
}

# create ecs cluster
module "ecs" {
    source = "./modules/ecs"
    ecs_name = "test-ecs-cluster"

    familytype  = "service"
    pathJson = "${file("service.json")}"

    service_name = "my-first-service"



  
}


module "load_balancer" {
    source = "./modules/load_balancer"
    lb_name = "new-lb1"
    lb_type = "application"
    tg_name = "target-group2"




}
# module "ecs-task" {
#   source = "./modules/ecs"
#   familytype  = "service"
#   pathJson = "${file("service.json")}"
# }

# module "ecs_task_def" {
#     source = "./modules/ecs_task_def"
#     familytype  = "service"
#     # cluster = "test-ecs-cluster"
#     pathJson = "${file("service.json")}"

# }




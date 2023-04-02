terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
  required_version = ">= 0.13"
}

provider "gitlab" {
    token = var.gitlab_token
    base_url = var.base_url
}


data "gitlab_group" "example" {
    full_path = "devops_users_repos/1597"	
}

# Add a project owned by the user
resource "gitlab_project" "terraform_project" {
    name = "terraform_1597v1"
    description  = "Apple"
    visibility_level = "private"
    namespace_id = data.gitlab_group.example.id
}

# Add a deploy key to the project
resource "gitlab_deploy_key" "terraform_project" {
    project = gitlab_project.terraform_project.id
    title = "terraform example key"
    key = var.deploy_key

}

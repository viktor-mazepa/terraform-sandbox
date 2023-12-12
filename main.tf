resource "google_container_cluster" "terraform-demo" {
  name     = "terraform-demo"
  location = var.GOOGLE_REGION

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "main" {
  name       = "main"
  location   = google_container_cluster.terraform-demo.location
  project    = google_container_cluster.terraform-demo.project
  cluster    = google_container_cluster.terraform-demo.name
  node_count = var.GKE_NUM_NODES

  node_config {
    machine_type = var.GKE_MACHINE_TYPE
  }
}


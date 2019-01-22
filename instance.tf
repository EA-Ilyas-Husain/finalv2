module "mig1" {
  source            = "GoogleCloudPlatform/managed-instance-group/google"
  version           = "1.1.14"
  region            = "${var.region}"
  zone              = "${var.zone2}"
  name              = "group1"
  compute_image     = "packer-1547996656"
  size              = 2
  service_port      = 80
  service_port_name = "http"
  http_health_check = false
  target_tags       = ["allow", "http-server"]
  ssh_source_ranges = ["0.0.0.0/0"]
  autoscaling        = true
  autoscaling_cpu = [{
    target = 0.8
  }]
}

module "mig2" {
  source            = "GoogleCloudPlatform/managed-instance-group/google"
  version           = "1.1.14"
  region            = "${var.region}"
  zone              = "${var.zone}"
  name              = "group2"
  compute_image     = "packer-1547982783"
  size              = 2
  service_port      = 80
  service_port_name = "http"
  http_health_check = false
  target_tags       = ["allow", "http-server"]
  ssh_source_ranges = ["0.0.0.0/0"]
  autoscaling       = true
  autoscaling_cpu   = [{
    target = 0.8
  }]
}

module "gce-lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google"
  name              = "group-http-lb-v2"
  target_tags       = ["${module.mig1.target_tags}", "${module.mig2.target_tags}"]
  backends          = {
    "0" = [
      { group = "${module.mig1.instance_group}" },
      { group = "${module.mig2.instance_group}" }
    ],
  }
  backend_params    = [
    # health check path, port name, port number, timeout seconds.
    "/health_check,http,80,10"
  ]
}

resource "google_compute_http_health_check" "default" {
  name         = "authentication-health-check"
  request_path = "/health_check"

  timeout_sec        = 1
  check_interval_sec = 1
}

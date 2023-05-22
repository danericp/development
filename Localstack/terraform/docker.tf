resource "docker_container" "host-centos7" {
  image             = "centos:7"
  name              = "docker-centos7"
  must_run          = true
  publish_all_ports = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}

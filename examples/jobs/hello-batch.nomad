job "hello-batch" {
  datacenters = ["us-west-2"]
  type        = "batch"

  group "batch-group" {
    count = 1

    task "echo-task" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        args  = [
          "-text=Hello from Nomad batch job!"
        ]
      }

      resources {
        cpu    = 100
        memory = 128
      }

      # No service block since this is a batch job and doesn't expose a long-running service
    }
  }
}

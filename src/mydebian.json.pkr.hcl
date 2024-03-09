
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "${file("./folderid")}"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e2lmhdqcqkrquqlc3ae2"
  token               = "${file("./yctoken")}"
  use_ipv4_nat        = true
  zone                = "ru-central1-b"
}


#  image_id            = "fd84ka5155c2q1sj230g"
#  family_id           = "ubuntu-2204-lts-vgpu-v15"  

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = ["echo 'hello from packer'",
              "sudo apt-get update",
              "sudo apt-get install ca-certificates curl",
              "sudo install -m 0755 -d /etc/apt/keyrings",
              "sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc",
              "sudo chmod a+r /etc/apt/keyrings/docker.asc",
              "echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian  $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
              "sudo apt-get update",
              "sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
    ]
  }
}


# черновики

#  "sudo apt-get update",
#    "sudo apt-get install -y ca-certificates curl gnupg",
#    "sudo install -m 0755 -d /etc/apt/keyrings",
#    "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
#    "sudo chmod a+r /etc/apt/keyrings/docker.gpg",
#    "echo \"deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \"$(. /etc/os-release && echo \"$VERSION_CODENAME\")\" stable\" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
#    "sudo apt-get update",
#    "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",

        

 #              "export DEBIAN_FRONTEND=noninteractive",
 #             "sudo apt-get update",
 #             "sudo apt-get install -y ca-certificates curl gnupg",
 #             "sudo install -m 0755 -d /etc/apt/keyrings",
 #             "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
 #             "sudo chmod a+r /etc/apt/keyrings/docker.gpg",
 #             "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable\" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
 #             "sudo apt-get update",
 #             "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"

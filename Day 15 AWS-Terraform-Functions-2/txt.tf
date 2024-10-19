#   user_data = <<-EOF
#     #!/bin/bash
#     sudo apt update
#     sudo apt install nginx -y
#     sudo apt install git -y
#     sudo git clone https://github.com/saikiranpi/SecOps-game.git
#     sudo rm -rf /var/www/html/index.nginx-debian.html
#     sudo cp  SecOps-game/index.html /var/www/html/index.html
#     echo "<h1>${var.vpc_name}-private-Server-${count.index + 1}</h1>" >> /var/www/html/index.html
#     sudo systemctl start nginx
#     sudo systemctl enable nginx
# EOF


# provisioner "file" {
#   source      = "user_data.sh"
#   destination = "/tmp/user_data.sh"

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("LaptopKey.pem")
#     host        = element(aws_instance.public-servers.*.public_ip, count.index)
#   }
# }

# provisioner "remote-exec" {
#   inline = [
#     "sudo chmod 777 /tmp/userdata.sh",
#     "sudo /tmp/userdata.sh",
#     "sudo apt update",
#     "sudo apt install jq unzip -y",
#   ]

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("SecOps-Key.pem")
#     host        = element(aws_instance.public-server.*.public_ip, count.index)
#   }
# }

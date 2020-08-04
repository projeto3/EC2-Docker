
resource "aws_instance" "projeto3" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  key_name = "testejk"
  subnet_id     = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  associate_public_ip_address	= "true"
  
  user_data = "${file("user_data.sh")}"
tags = {
        Name = "DEV Teste Infraesturura Agil"
        Projeto = "Infraestrutura como codigo"
        Curso = "Redes de Computadores"
        Materia = "Projeto Integrador 3"
        Gerente_do_Projeto = "Professor Pablo Menezes"
    }
}
output "aws_ip" {
    value = "${aws_instance.projeto3.public_ip}"
}

output "aws_dns" {
    value = "${aws_instance.projeto3.public_dns}"
}

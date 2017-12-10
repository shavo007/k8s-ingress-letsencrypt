provider "aws" {
  region  = "ap-southeast-2"
}

resource "aws_route53_zone" "subdomain" {
  name = "${var.shane_sub_domain}"

  tags {
    Environment = "${var.shane_sub_domain}"
  }
}

resource "aws_route53_record" "subdomain" {
  zone_id = "${var.route53_zone_id}"
  name    = "${var.shane_sub_domain}"
  type    = "NS"
  ttl     = "30"

  records = [
    "${aws_route53_zone.subdomain.name_servers.0}",
    "${aws_route53_zone.subdomain.name_servers.1}",
    "${aws_route53_zone.subdomain.name_servers.2}",
    "${aws_route53_zone.subdomain.name_servers.3}",
  ]
}



output "Route53 Zone id" {
  value = "${aws_route53_zone.subdomain.id}"
}

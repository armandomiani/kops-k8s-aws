resource "aws_iam_group" "kops_group" {
  name = "${var.project.default_group_name}"
}

resource "aws_iam_group_policy_attachment" "kops_group_ec2_full_access" {
  group = "${aws_iam_group.kops_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "kops_group_vpc_full_access" {
  group = "${aws_iam_group.kops_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_group_policy_attachment" "kops_group_iam_full_access" {
  group = "${aws_iam_group.kops_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_user" "kops_user" {
  name = "${var.project.default_user_name}"
}

resource "aws_iam_access_key" "kops_access_key" {
  user = "${aws_iam_user.kops_user.name}"
}

output "aws_access_key_secret" {
    value = "${aws_iam_access_key.kops_access_key.secret}"
}

output "aws_access_key_id" {
    value = "${aws_iam_access_key.kops_access_key.id}"
}
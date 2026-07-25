# Portfolio Scope Boundaries

The projects are intentionally sequential. Each one builds on the last rather
than re-implementing it.

| Project | Owns | Does not own |
| --- | --- | --- |
| Project 1 | Terraform project foundation, VPC, private compute, IAM baseline, secure storage, remote state | Monitoring logic, alert rules, CI/CD workflows |
| Project 2 | CloudWatch metrics/logs, dashboards, alarms, notifications, operational response automation | Core VPC and workload design |
| Project 3 | GitHub Actions, Terraform checks, plans, approval gates, controlled applies | Monitoring design or foundational network architecture |

Project 1 will expose resource IDs and names as Terraform outputs. Project 2
will consume those resources for monitoring. Project 3 will automate the
existing Terraform workflow after it has been proven locally.

# Validation Strategy

Phase 1 uses Terraform formatting and configuration validation. Later phases
will add checks appropriate to deployed infrastructure, such as security-group
rule review, private-instance reachability validation, and evidence capture.

Run the current local checks from the repository root:

```powershell
.\scripts\validate.ps1
```

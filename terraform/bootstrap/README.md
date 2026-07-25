# Remote State Bootstrap

This configuration creates the S3 bucket required to store Terraform state for
the main project. Apply it once using local state, then keep the bucket while
the main project exists.

See `../../docs/manual-setup.md` for the exact sequence.

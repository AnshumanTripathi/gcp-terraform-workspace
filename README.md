This workspace is a Terraform sandbox to learn and test infrastructure with GCP.
If you want to use this workspace please create an issue with your email or reach out to [Anshuman Tripathi](mailto:anshuman.tripathi@hey.com).

# Setup
Read more about how this workspace is setup here - https://www.anshumantripathi.com/projects/setup-terraform/

This workspace uses the [safer-cluster submodule](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/2fe171500c3496eb88b9fdf83318b0927d225e4b/examples/safer_cluster) in the GKE Terraform module. The safer-cluster creates a publicly accessible cluster. To further harden the cluster, we will use [Identity Aware Proxy (IAP) bastion with the safer cluster](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/2fe171500c3496eb88b9fdf83318b0927d225e4b/examples/safer_cluster_iap_bastion)

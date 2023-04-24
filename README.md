# Infrastructure
Base infrastructure for the data lake

## Setup

1. Go to terraform folder
```sh
 $ cd terraform
```

2. Replace the backend file with the local backend file
```sh
 $ cat backends/local.tf > backend.tf
```

3. Initialize terraform
```sh
 $ terraform init
```

4. Copy the contents of the file config/variables.tfvars.example to a new file named config/variables.tfvars
```sh
 $ cp config/variables.tfvars.example config/variables.tfvars
```

5. Set the values of the variables in the variables.tfvars

6. Apply terraform to create the resources (you may need to login with gcloud cli first)
```sh
 $ terraform apply -var-file=./config/variables.tfvars
```

7. Copy the contents of the config/backend.hcl.example to a new file named config/backend.hcl
```sh
 $ cp config/backend.hcl.example config/backend.hcl
```

8. Set the value of the variable bucket equal to {project_id you choose on step 5}-terraform-state

9. Replace the backend file with the gcs backend file
```sh
 $ cat backends/gcs.tf > backend.tf
```

10. Migrate the terraform state to the bucket
```sh
 $ terraform init -backend-config=./config/backend.hcl -migrate-state
```

Now you can run terraform commands as follows:
```sh
 # To initialize terraform. Since the state is in the gcs bucket, no need to use local backend (steps 2, 3, 6, 9, and 10).
 $ terraform init -backend-config=./config/backend.hcl

 # To show changes to be applied to the infrastructure
 $ terraform plan -var-file=./config/variables.tfvars

 # To apply changes to the infrastructure
 $ terraform apply -var-file=./config/variables.tfvars
```


#################################################
#
#                    kuberneteeees
#
##################################################


resource_group_name = "k8s"

location = "westeurope"

cluster_name = "k8sdev"

dns_prefix = "lab" #env

#your public key for access
ssh_public_key = "~/.ssh/id_rsa.pub"

agent_count = "2"

client_id = "put here your client id"
#https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest

client_secret = "insert your secret"

#dont change node_name
node_name = "default"

node_size = "Standard_B2ms"

node_disk_size = "30"




# Create a Namespace to hold the Jupyter Application
kubectl create namespace jupyter

# Create the Jupyter Deployment
kubectl create -f jupyter.yaml

# Wait for the containers to become ready using the watch command
watch kubectl get pods --namespace jupyter

# Get the initial login token once the Jupyter container is up and running
pod_name=$(kubectl get pods --namespace jupyter --no-headers | awk '{print $1}') \
kubectl logs --namespace jupyter ${pod_name}

# Set up port forwarding to the Jupyter container
kubectl port-forward --namespace jupyter ${pod_name} 8888:8888


# Visit https://localhost:8888/?token=<token>

# Sample token
#  /?token=8c1961c674f8541842ed334b771a2a9643cc057facfb6478





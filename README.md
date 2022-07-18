### Jupyter


![Project Jupyter](https://th.bing.com/th/id/OIP.nOOjX57LSsDMI6POI6FpOAHaDm?pid=ImgDet&rs=1)


The Jupyter Project is a web-based interactive scientific notebook for exploration and
visualization. It is used by students and scientists around the world to build and
explore data and data visualizations.

## SET UP

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


Tomemos en cuenta el significado de Pods:
> Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

1. Vamos a crear un namespace llamado `k8session` con el comando kubectl:

```{{exec}}
kubectl create ns k8session
```
2. Creamos un archivo llamado mypod.yaml:

```shell
touch mypod.yaml
```
3. A continuación, vamos a crear un Pod llamado `mi-primer-pod` usando una imagen `nginx:alpine` en el namespace `k8session`, para ello usaremos el editor para editar mypod.yaml.
Escribiremos la siguiente información:

```YAML
apiVersion: v1
kind: Pod
metadata:
  name: mi-primer-pod
spec:
  containers:
  - name: mi-primer-pod
    image: nginx:alpine
    ports:
    - containerPort: 80
```
4. Instalamos usando el archivo YAML configurado con el comando kubectl en el namespace `k8session`:

```exec
kubectl apply -f mypod.yaml -n k8session
```

Validar que nuestro pod creado esté en running en el namespace `k8session`:

```{{exec}}
kubectl get pods -n k8session
```

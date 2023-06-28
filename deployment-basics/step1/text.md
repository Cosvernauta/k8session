Tomemos en cuenta el significado de Pods:
> Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

Vamos a crear un namespace llamado `k8session` con el comando kubectl:

```plain
kubectl create ns k8session
```{{exec}}

Creamos un archivo llamado mypod.yaml:
```plain
touch mypod.yaml
```{{exec}}

<br> A continuación, vamos a crear un Pod llamado `mi-primer-pod` usando una imagen `nginx:alpine` en el namespace `k8session`, para ello usaremos el editor para editar mypod.yaml.
Escribiremos la siguiente información:<br>

```plain
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
```{{exec}}

<br> Instalamos usando el archivo YAML configurado con el comando kubectl en el namespace `k8session`:<br>
```plain
kubectl apply -f mypod.yaml -n k8session
```{{exec}}

<br> Validar que nuestro pod creado esté en running en el namespace `k8session`:<br>
```plain
kubectl get pods -n k8session
```{{exec}}

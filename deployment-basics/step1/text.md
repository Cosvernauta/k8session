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

A continuación, vamos a crear un Pod llamado `mi-primer-pod` usando una imagen `nginx:alpine` en el namespace k8session, para ello usaremos el editor para editar mypod.yaml.
Colocaremos la siguiente información:
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

Instalamos usando el archivo YAML configurado con el comando kubectl:
```plain
kubectl apply -f mypod.yaml
```{{exec}}

Validar que nuestro pod creado esté en running:
```plain
kubectl get pods
```{{exec}}
<br>
<details><summary>Solution</summary>
<br>

```plain
k create deployment my-first-deployment --image=nginx:alpine

k get deployment my-first-deployment
```{{exec}}

</details>

El área de desarrollo nos está pidiendo que instalemos un nginx en nuestro cluster, por lo cual el equipo de Arquitectura nos indica que debe ser creado en un namespace especial.

Ya que eliminamos nuestro pod en el ejercicio anterior, vamos a proceder a crear un POD usando deployment. Para ello vamos a crear un namespace llamado `k8sdeploy`.

br>
<details><summary>Solution</summary>
<br>

```plain
kubectl create ns k8sdeploy
```{{exec}}

</details>

Una vez que tenemos nuestro namespace creado, vamos a proceder a crear la estructura de nuestro archivo YAML con la siguiente información en un archivo llamado myDeploy.yaml:

```text
**nombre del deploy:** nginx-deploy
**Etiquetas:** app: nginx
**replicas: 3
**nombre del contenedor:** nginx
**image:** nginx:1.14.2
**containerPort:** 80
```
br>
<details><summary>Solución</summary>
<br>

```plain
touch myDeploy.yaml
```{{exec}}

```YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

</details>

1. Una vez creado nuestro archivo myDeploy.yaml, vamos a proceder a instalarlo con el comando apply dentro de kubectl en el namespace llamado `k8sdeploy`:

```plain
kubectl apply -f myDeploy.yaml -n k8sdeploy
```{{exec}}

2. Validemos la información con la que se deployó el deployment con el comando get en el namespace `k8sdeploy`:

```plain
kubectl get deploy -n k8sdeploy
```{{exec}}

3. Revisemos que los pods estén en running, el cual deben ser un total de 3 pods por la cantidad de replicas que se configuraron.

4. Si nuestros pods están en running, ¡Excelente!, acabas de instalar un microservicio como objeto Deployment.

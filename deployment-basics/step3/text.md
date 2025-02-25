El área de desarrollo nos está pidiendo que instalemos un nginx en nuestro cluster, por lo cual el equipo de Arquitectura nos indica que debe ser creado en un namespace especial.

Ya que eliminamos nuestro pod en el ejercicio anterior, vamos a proceder a crear un POD usando deployment. Para ello vamos a crear un namespace llamado `k8sdeploy`.

```plain
kubectl create ns k8sdeploy
```{{exec}}

Una vez que tenemos nuestro namespace creado, vamos a proceder a crear la estructura de nuestro archivo YAML con la siguiente información en un archivo llamado myDeploy.yaml:


**nombre del deploy:** nginx-deploy<br>
**Etiquetas:** app: nginx<br>
**replicas:** 3<br>
**nombre del contenedor:** nginx<br>
**image:** nginx:1.14.2<br>
**containerPort:** 80<br>

```plain
touch myDeploy.yaml
```{{exec}}

<details>
<summary><b>Solucion</b></summary>

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

- Una vez creado nuestro archivo myDeploy.yaml, vamos a proceder a instalarlo con el comando apply dentro de kubectl en el namespace llamado `k8sdeploy`:

```plain
kubectl apply -f myDeploy.yaml -n k8sdeploy
```{{exec}}

- Validemos la información con la que se deployó el deployment con el comando get en el namespace `k8sdeploy`, en la columna AVAILABLE deben aparecer 3 (puede demorar unos 3 minutos):

```plain
kubectl get deploy -n k8sdeploy
```{{exec}}

- Revisemos que los pods estén en running, el cual deben ser un total de 3 pods por la cantidad de replicas que se configuraron.

- Si nuestros pods están en running, ¡Excelente!, acabas de instalar un microservicio como objeto Deployment.

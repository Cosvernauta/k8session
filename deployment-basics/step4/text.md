El área de Arquitectura está enviando una solicitud para que se pueda escalar y ampliar el microservicio de NGINX, debido a la gran carga que se aproxima en los siguientes días.

La información que proporcionan es la siguiente:


**replicas:** 10<br>
**image:** nginx:1.15.10<br>
**containerPort:** 8080<br>
https://hub.docker.com/_/nginx/tags?page=1&name=1.15

- Realizamos una copia del archivo myDeploy.yaml con el nombre myDeploy_1.15.yaml

```plain
cp -rp myDeploy.yaml myDeploy_1.15.yaml
```{{exec}}

- Procedemos a actualizar la información en el archivo myDeploy_1.15.yaml en nuestro editor y lo deployamos en el namespace `k8sdeploy`.


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
  replicas: 10
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
        image: nginx:1.15.10
        ports:
        - containerPort: 8080
```

</details>

- Una vez actualizado, revisamos el deployment y observamos que tengamos 10 en AVAILABLE, en el namespace llamado `k8sdeploy`:

```plain
kubectl get deploy -n k8sdeploy
```{{exec}}

- Revisemos que los pods estén en running, el cual deben ser un total de 10 pods por la cantidad de replicas que se configuraron.

- Revisemos los logs con `kubectl logs` en alguno de los pods, para observar los logs generados.

- Si nuestros pods están en running, ¡Excelente!, acabas de actualizar un microservicio como objeto Deployment.

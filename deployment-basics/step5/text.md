El área de Arquitectura nos indica que ya no se va a utilizar nginx en nuestra solución de microservicios, por lo cual nos piden que reduzcamos la cantidad de pods.

La información que proporcionan es la siguiente:


**replicas:** 2<br>


- Realizamos una copia del archivo myDeploy_1.15.yaml con el nombre myDeploy_1.15v2.yaml

```plain
cp -rp myDeploy_1.15.yaml myDeploy_1.15v2.yaml
```{{exec}}

- Procedemos a actualizar la información en el archivo myDeploy_1.15v2.yaml en nuestro editor y lo deployamos en el namespace `k8sdeploy`.


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
  replicas: 2
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

<details>
<summary><b>Solucion</b></summary>

```YAML
kubectl apply -f myDeploy_1.15v2.yaml -n k8sdeploy
```

</details>

- Una vez actualizado, revisamos el deployment y observamos que tengamos 2 en AVAILABLE, en el namespace llamado `k8sdeploy`:

```plain
kubectl get deploy -n k8sdeploy
```{{exec}}

- Revisemos que los pods estén en running, el cual deben ser un total de 2 pods por la cantidad de replicas que se configuraron.

## Clean Up

El equipo de Arquitectura, junto con las áreas de Network, indican que ya no hay tráfico hacia los pods de NGINX, ya que se migró la tecnología hacia otro tipo de balanceo, por lo cual nos piden que ya demos de baja todo el microservicio.

- Procedemos a eliminar el deploy que realizamos usando el archivo YAML llamado myDeploy_1.15v2.yaml, en el namespace `k8sdeploy` (arma tu comando para resolverlo, en caso que no; la respuesta se encuentra oculta en Solución).

<details>
<summary><b>Solucion</b></summary>

```plain
kubectl delete -f myDeploy_1.15v2.yaml -n k8sdeploy
```{{exec}}

</details>

- Revisar que ya no tengamos recursos en el namespace `k8sdeploy` (usando el comando get deploy)

- Procedemos a eliminar el namespace llamado `k8sdeploy` (arma tu comando para resolverlo, en caso que no; la respuesta se encuentra oculta en Solución)

<details>
<summary><b>Solucion</b></summary>

```plain
kubectl delete ns k8sdeploy
```{{exec}}

</details>

- Enlistamos todos los namespace que tenemos en nuestro cluster con `kubectl get ns`y validamos que ya no exista k8sdeploy.

¡Enhorabuena! acabas de eliminar todo el microservicio que tenías en el cluster, contesta la siguiente pregunta:

- [ ] ¿Que pasaría si se elimina un namespace con recursos dentro de él?

En el paso anterior, creamos un pod llamado `mi-primer-pod` en el cual validamos que existiera.

- Vamos a ejecutar nuevamente una validación del pod para observar que esté en running:

```plain
kubectl get pods -n k8session
```{{exec}}

- Validemos la información con la que se deployó el pod con el comando describe en el namespace `k8session`:

```plain
kubectl describe pods mi-primer-pod -n k8session
```{{exec}}

Con la información mostrada ¿En qué línea podemos saber el estado que muestra que nuestro pod está en running?

[ ] En Containers, en el apartado Ready.
[ ] En Containers, en el apartado State.
[ ] En ningún lado.

- Una vez que hemos visto que nuestro pod fue creado, entremos al pod.

<details>
<summary><b>Solucion<b></summary>

```plain
kubectl exec -it mi-primer-pod -n k8session -- sh
```{{exec}}

</details>

- Revisemos dentro del pod, ejecutando algunos comandos como: ps, curl http://localhost/, ss, netstat -ltnp. Cuando terminenos ejecutamos el comando `exit`.

## Clean Up

Una vez que hemos salido del pod, vamos a proceder a borrar lo instalado, por lo cual vamos a proceder a borrar el pod, usando el archivo mypod.yaml

```plain
kubectl delete -f mypod.yaml -n k8session
```{{exec}}

- Eliminemos el namespace que creamos llamado `k8session`:
```plain
kubectl delete ns k8session
```{{exec}}

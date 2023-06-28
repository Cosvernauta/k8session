En el paso anterior, creamos un pod llamadoi `mi-primer-pod` en el cual validamos que existiera.

1. Vamos a ejecutar nuevamente una validación del pod para observar que esté en running:

```plain
kubectl get pods -n k8session
```{{exec}}

2. Validemos la información con la que se deployó el pod con el comando describe en el namespace `k8session`:

```plain
kubectl describe mi-primer-pod -n k8session
```{{exec}}

3. Una vez que hemos visto que nuestro pod fue creado, entremos al pod.
br>
<details><summary>Solucion</summary>
<br>
```plain
kubectl exec mi-primer-pod -n k8session -- bash
```{{exec}}
</details>

4. Revisemos dentro del pod, ejecutando algunos comandos como: ps, curl http://localhost/, ss, netstat -ltnp.

## Clean Up

5. Una vez que hemos salido del pod, vamos a proceder a borrar lo instalado, por lo cual vamos a proceder a borrar el pod, usando el archivo mypod.yaml

```plain
kubectl delete -f mypod.yaml
```{{exec}}
6. Eliminemos el namespace que creamos llamado `k8session`:
```plain
kubectl delete ns k8session
```{{exec}}
7. Eliminamos el archivo YAML que creamos con el comando rm:
```plain
rm -rf mypod.yaml
```{{exec}}

# kube-performance

kubernetes e2e performance plugin of [Sonobuoy](https://github.com/heptio/sonobuoy)

use command `e2e.test --ginkgo.focus="\[Feature:Performance\]" --provider=local --kubeconfig=/kube/config` to test the performance of 
kubernetes.

## Usage

1. Start e2e performance test.

```
kubectl create -f e2e-performance.yml
```

2. Copy the output directory from the main Sonobuoy pod to somewhere local.

```
kubectl cp heptio-sonobuoy/sonobuoy:/tmp/sonobuoy ./results --namespace=heptio-sonobuoy
```

3. View the results.

```
cd results && tar -zxvf *.tar.gz
```

4. Clean up.

```
kubectl delete -f e2e-performance.yml
```
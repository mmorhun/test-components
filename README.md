## Info

The `monorepo` branch contains another Application named `monorepo` and two Components (`component1` and `component2`) each in it's own directory: `component1dir` and `component2dir` correspondingly.

## Deployment

```
export NAMESPACE=test
kubectl create namespace $NAMESPACE
kubectl apply -k ./depoy/monorepo-qpp --namespace=$NAMESPACE
```

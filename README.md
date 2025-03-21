## Info

Simple sample Konflux Components for testing.

The `main` branch contains Application named `main-app` and Component named `main-component`.

The `monorepo` branch contains another Application named `monorepo` and two Components (`component1` and `component2`) each in own directory.

## Deployment

```
export NAMESPACE=test
kubectl create namespace $NAMESPACE
kubectl apply -k ./depoy --namespace=$NAMESPACE
```
Alternatively, deploy only one app:
```
kubectl apply -k ./depoy/main-app --namespace=$NAMESPACE
```
or
```
kubectl apply -k ./depoy/monorepo-qpp --namespace=$NAMESPACE
```

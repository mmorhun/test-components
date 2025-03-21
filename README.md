## Info

Simple sample Konflux Components for testing.

The `main` branch contains Application named `main-app` and Component named `main-component`.

The `monorepo` branch contains another Application named `monorepo` and two Components (`component1` and `component2`) each in own directory.

## Deployment

```
export NAMESPACE=test
kubectl create namespace $NAMESPACE
kubectl apply -k ./deploy --namespace=$NAMESPACE
```
Alternatively, deploy only one app:
```
kubectl apply -k ./deploy/main-app --namespace=$NAMESPACE
```
or
```
kubectl apply -k ./deploy/monorepo-app --namespace=$NAMESPACE
```

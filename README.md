## Info

Simple sample Konflux Components for testing.

The `main` branch contains Application named `main-app` and Component named `main-component`.

The `monorepo` branch contains another Application named `monorepo` and two Components (`component1` and `component2`) each in own directory.

The `component1-nudging` and `component2-nudged` branches contain Components to test nudging.

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
or
```
kubectl apply -k ./deploy/nudge-app --namespace=$NAMESPACE
```
Note, in order for nudging to work, image reference must match (see Dockerfile in `component2-nudged`).
By default, it's expected to deploy nudge components into `test` namespace and configured quay org must match.

or
```
kubectl apply -k ./deploy/multi-platform-app --namespace=$NAMESPACE
```

## Descrease resources requirements

To descrease resource requirements of build task and disable checks,
add the following resources override into your pipeline run:
```
spec:
  taskRunSpecs:
  - pipelineTaskName: build-container
    computeResources:
      requests:
        cpu: 250m
        memory: 256Mi
      limits:
        memory: 2Gi
  params:
  - name: skip-checks
    value: 'true'
```

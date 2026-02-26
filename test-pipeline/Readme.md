## Test Pipeline

Build and push bundle
```sh
export QUAY_ORG=my-org
tkn bundle push quay.io/$QUAY_ORG/test-bundle:task --filenames=test-task.yaml
```

Grant permissions to the task (optional)
```sh
NAMESPACE=my-tenant

envsubst <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: ${NAMESPACE}
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]
EOF

envsubst <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader
  namespace: ${NAMESPACE}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: pod-reader
subjects:
- kind: ServiceAccount
  name: build-pipeline-main-component
  namespace: ${NAMESPACE}
- kind: ServiceAccount
  name: build-pipeline-test-main-component
  namespace: ${NAMESPACE}
EOF
```

Replace existing pipeline with content of `test-pipeline-run.yaml` (update namespace)

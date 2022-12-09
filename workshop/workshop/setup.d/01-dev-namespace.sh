#!/bin/bash
set -x
set +e

kubectl patch serviceaccount default -p '{"secrets": [{"name": "git-https"}]}'
REGISTRY_PASSWORD=$CONTAINER_REGISTRY_PASSWORD kp secret create registry-credentials --registry ${CONTAINER_REGISTRY_HOSTNAME} --registry-user ${CONTAINER_REGISTRY_USERNAME}
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "registry-credentials"}, {"name": "tanzu-net-credentials"}]}'

kubectl annotate namespace ${SESSION_NAMESPACE} secretgen.carvel.dev/excluded-from-wildcard-matching-

cat << \EOF | kubectl apply -f -
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: developer-defined-tekton-pipeline
  labels:
    apps.tanzu.vmware.com/pipeline: test     # (!) required
spec:
  params:
  - name: source-url
    type: string
  - name: source-revision
    type: string
  - default: .
    name: source-sub-path
    type: string
  tasks:
  - name: test
    params:
    - name: source-url
      value: $(params.source-url)
    - name: source-revision
      value: $(params.source-revision)
    - name: source-sub-path
      value: $(params.source-sub-path)
    taskSpec:
      metadata: {}
      params:
      - name: source-url
        type: string
      - name: source-revision
        type: string
      - name: source-sub-path
        type: string
      spec: null
      steps:
      - image: gradle
        name: test
        resources: {}
        script: |-
          cd `mktemp -d`
          wget -qO- $(params.source-url) | tar xvz -m
          cd $(params.source-sub-path)
          ./mvnw test
EOF
cat << EOF | kubectl apply -f -
apiVersion: scanning.apps.tanzu.vmware.com/v1beta1
kind: ScanPolicy
metadata:
  name: scan-policy
spec:
  regoFile: |
    package main

    # Accepted Values: "Critical", "High", "Medium", "Low", "Negligible", "UnknownSeverity"
    notAllowedSeverities := []
    ignoreCves := ["GHSA-36p3-wjmg-h94x", "CVE-2021-26291", "GHSA-g36h-6r4f-3mqp", "CVE-2016-1000027"]

    contains(array, elem) = true {
      array[_] = elem
    } else = false { true }

    isSafe(match) {
      severities := { e | e := match.ratings.rating.severity } | { e | e := match.ratings.rating[_].severity }
      some i
      fails := contains(notAllowedSeverities, severities[i])
      not fails
    }

    isSafe(match) {
      ignore := contains(ignoreCves, match.id)
      ignore
    }

    deny[msg] {
      comps := { e | e := input.bom.components.component } | { e | e := input.bom.components.component[_] }
      some i
      comp := comps[i]
      vulns := { e | e := comp.vulnerabilities.vulnerability } | { e | e := comp.vulnerabilities.vulnerability[_] }
      some j
      vuln := vulns[j]
      ratings := { e | e := vuln.ratings.rating.severity } | { e | e := vuln.ratings.rating[_].severity }
      not isSafe(vuln)
      msg = sprintf("CVE %s %s %s", [comp.name, vuln.id, ratings])
    }
EOF


kubectl create secret generic db-binding-compatible --from-literal=type=postgresql --from-literal=provider=vac --from-literal=jdbc-url=jdbc:postgresql://emoji-postgresql.${SESSION_NAMESPACE}.svc.cluster.local:5432/emoji --from-literal=password=emoji --from-literal=username=postgres --from-literal=postgres-password=emoji

tanzu service claim create db-binding-compatible \
  --resource-name db-binding-compatible \
  --resource-kind Secret \
  --resource-api-version v1



cat <<EOF >>/home/eduk8s/workload.yaml
apiVersion: carto.run/v1alpha1
kind: Workload
metadata:
  name: inclusion
  annotations:
    autoscaling.knative.dev/min-scale: "5"
  labels:
    app.kubernetes.io/part-of: inclusion
    apps.tanzu.vmware.com/workload-type: web
    apps.tanzu.vmware.com/has-tests: "true"
spec:
  source:
    git:
      url: https://github.com/tsalm-pivotal/emoji-inclusion.git
      ref:
        branch: main
  build:
    env:
      - name: BP_JVM_VERSION
        value: "17"
  params:
  - name: api_descriptor
    value:
      type: openapi
      location:
        path: "/v3/api-docs"
      system: emoji-world
      owner: team-vmware-tanzu-se
      description: "A set of API endpoints to manage the resources within the inclusion app."
EOF

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: git-https
  annotations:
    tekton.dev/git-0: https://github.com
type: kubernetes.io/basic-auth
stringData:
  username: j-kolaric
  password: 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
EOF

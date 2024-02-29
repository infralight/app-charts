# app-charts

based on bitnami solution of vaules render:
https://github.com/bitnami/charts/blob/master/bitnami/common/templates/_tplvalues.tpl

#template values in anyplace e.g:
 configMapProperties:
   cmValue1: "val1"
   application.properties: |-
     prop1=prop1value
     prop2=prop2value
# configmap.yaml
data:
    {{- if .Values.configMapProperties }}
    {{- include "common.tplvalues.render" ( dict "value" .Values.configMapProperties "context" $ ) | nindent 2 }}
    {{- end }}



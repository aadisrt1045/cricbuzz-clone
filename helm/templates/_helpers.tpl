{{/*
Expand the name of the chart.
*/}}
{{- define "cricbuzz-clone.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes resources have naming limits.
*/}}
{{- define "cricbuzz-clone.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if ne .Release.Name $name }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cricbuzz-clone.labels" -}}
helm.sh/chart: {{ include "cricbuzz-clone.chart" . }}
{{ include "cricbuzz-clone.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cricbuzz-clone.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cricbuzz-clone.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

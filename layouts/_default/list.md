---
title: "{{ .Title }} · {{ .Site.Title }}"
kind: "{{ .Kind }}"
url: "{{ .Permalink }}"
markdown_url: "{{ .Permalink }}index.md"
content_signal: "search=yes, ai-input=yes, ai-train=no"
---

# {{ .Title }} — Markdown for Agents ({{ .Kind }})

{{- with .Description }}
> {{ . }}
{{- end }}

{{- $refUnix := (time "2026-10-25T12:00:00+08:00").Unix }}
{{- range sort .Pages "Lastmod" "desc" }}
{{- $ageDays := div (sub $refUnix .Lastmod.Unix) 86400 }}
{{- $isStale := gt $ageDays 180 }}
- **[{{ .Lastmod.Format "2006-01-02" }}]{{ if $isStale }} [STALE_OVER_6M:{{ $ageDays }}d]{{ end }} [{{ .Title }}]({{ .Permalink }}index.md)**
  {{- with .Params.summary }}
  - Summary: {{ . }}
  {{- end }}
  {{- with .Params.ext_url }}
  - Primary Source: {{ . }}
  {{- end }}
  {{- with .Params.backup_url }}
  - Backup Source: {{ . }}
  {{- end }}
  {{- with .Params.tags }}
  - Tags: {{ range . }}`#{{ . }}` {{ end }}
  {{- end }}
{{- end }}

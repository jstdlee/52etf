---
title: "{{ .Site.Title }}"
url: "{{ .Permalink }}"
markdown_url: "{{ .Permalink }}index.md"
json_index_url: "{{ "index.json" | absURL }}"
llms_txt_url: "{{ "llms.txt" | absURL }}"
llms_full_txt_url: "{{ "llms-full.txt" | absURL }}"
link_audit_url: "{{ "404.txt" | absURL }}"
agent_card_url: "{{ ".well-known/agent.json" | absURL }}"
mcp_manifest_url: "{{ ".well-known/mcp.json" | absURL }}"
content_signal: "search=yes, ai-input=yes, ai-train=no"
policy: "Pure objective economic/crypto/market data cache & verified URLs only. Zero market commentary. Zero personal asset disclosure."
---

# {{ .Site.Title }} — Markdown for Agents (Home Directory)

> **Content-Signal**: `search=yes, ai-input=yes, ai-train=no`
> **Policy**: 仅做客观经济数据缓存与有效连接呈现，不做任何市场解读，不透露任何个人资产或持仓信息。
> **Full Single-File Corpus**: [{{ "llms-full.txt" | absURL }}]({{ "llms-full.txt" | absURL }})
> **Structured JSON Index**: [{{ "index.json" | absURL }}]({{ "index.json" | absURL }})
> **404 & Stale (>6m) Link Audit**: [{{ "404.txt" | absURL }}]({{ "404.txt" | absURL }})

{{- $refUnix := (time "2026-10-25T12:00:00+08:00").Unix }}
{{- $allPages := where .Site.RegularPages "Section" "!=" "" }}
{{- $sortedPages := sort $allPages "Lastmod" "desc" }}

## Categories ({{ len .Site.Sections }})

{{- range sort .Site.Sections "Section" "asc" }}
{{- $secStale := 0 }}
{{- range .RegularPages }}
  {{- if gt (div (sub $refUnix .Lastmod.Unix) 86400) 180 }}
    {{- $secStale = add $secStale 1 }}
  {{- end }}
{{- end }}
- **[{{ .Title }}]({{ .Permalink }}index.md)** ({{ len .RegularPages }} items{{ if gt $secStale 0 }}, {{ $secStale }} stale >6m{{ end }}) — HTML: {{ .Permalink }}
{{- end }}

## All Cached Indicators ({{ len $sortedPages }})

{{- range $sortedPages }}
{{- $ageDays := div (sub $refUnix .Lastmod.Unix) 86400 }}
{{- $isStale := gt $ageDays 180 }}
- **[{{ .Lastmod.Format "2006-01-02" }}]{{ if $isStale }} [STALE_OVER_6M:{{ $ageDays }}d]{{ end }} [{{ .Title }}]({{ .Permalink }}index.md)**
  - Summary: {{ .Params.summary }}
  - Category: `{{ .Section }}` | Tags: {{ range .Params.tags }}`#{{ . }}` {{ end }}
  - Primary Source: {{ .Params.ext_url }}
  - Backup Source: {{ .Params.backup_url }}
  - HTML Page: {{ .Permalink }} | Markdown Twin: {{ .Permalink }}index.md | Repo File: `content/{{ .File.Path }}`
{{- end }}

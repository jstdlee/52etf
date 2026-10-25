{{- $refUnix := (time "2026-10-25T12:00:00+08:00").Unix -}}
{{- $ageDays := div (sub $refUnix .Lastmod.Unix) 86400 -}}
{{- $isStale := gt $ageDays 180 -}}
---
title: {{ .Title | jsonify }}
section: "{{ .Section }}"
date: "{{ .Date.Format "2006-01-02" }}"
lastmod: "{{ .Lastmod.Format "2006-01-02" }}"
age_days: {{ $ageDays }}
stale_over_6m: {{ $isStale }}
tags: {{ (.Params.tags | default slice) | jsonify }}
summary: {{ (.Params.summary | default "") | jsonify }}
ext_url: {{ (.Params.ext_url | default "") | jsonify }}
backup_url: {{ (.Params.backup_url | default "") | jsonify }}
html_url: "{{ .Permalink }}"
markdown_url: "{{ .Permalink }}index.md"
repo_file: "content/{{ .File.Path }}"
content_signal: "search=yes, ai-input=yes, ai-train=no"
---

# {{ .Title }}{{ if $isStale }} [STALE_OVER_6M: {{ $ageDays }}d]{{ end }}

- **缓存更新日期 (Lastmod)**: `{{ .Lastmod.Format "2006-01-02" }}` ({{ if $isStale }}超6个月未更新: {{ $ageDays }}天{{ else }}正常缓存期内: {{ $ageDays }}天{{ end }})
- **所属分类 (Category)**: `{{ .Section }}` ({{ .CurrentSection.Title }})
- **标签 (Tags)**: {{ range .Params.tags }}`#{{ . }}` {{ end }}
- **缓存摘要 (Summary)**: {{ .Params.summary }}
- **主数据源链接 (Primary URL)**: {{ .Params.ext_url }}
- **备用校准链接 (Backup URL)**: {{ .Params.backup_url }}
- **GitHub 校准源文件 (Repo Path)**: `content/{{ .File.Path }}`

---

{{ .RawContent }}

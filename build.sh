#!/usr/bin/env bash
# Builds the GitHub Pages site (index.html) from src/app.html.
# src/app.html is the same page body that is published as the claude.ai artifact,
# so this only wraps it in a full HTML document.
set -euo pipefail
cd "$(dirname "$0")"
{
  cat <<'HEAD'
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="자기소개서 기반 예상 질문, 꼬리질문·압박 모의 면접, 카메라·음성 분석으로 면접을 연습하는 사이트">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='7' fill='%231d6b58'/%3E%3Cpath d='M9 12h14M9 17h10M9 22h6' stroke='white' stroke-width='2.4' stroke-linecap='round'/%3E%3C/svg%3E">
<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
</head>
<body>
HEAD
  cat src/app.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "built index.html ($(wc -c < index.html) bytes)"

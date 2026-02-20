#!/bin/bash
# 던전 앤 스톤(DAS) 게임 개발 대화 로그 날짜별 동기화

REPO="C:/Users/user/DAS-claudecode"
SOURCE="C:/Users/user/.claude/projects/C--Users-user"
DATE=$(date +"%Y-%m-%d")
DEST="$REPO/conversations/$DATE"

mkdir -p "$DEST"
cp "$SOURCE"/*.jsonl "$DEST/" 2>/dev/null

cd "$REPO" || exit

if ! git diff --quiet || git ls-files --others --exclude-standard | grep -q .; then
  git add .
  git commit -m "[$DATE] DAS 대화 로그 업데이트"
  git push
fi

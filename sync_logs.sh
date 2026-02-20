#!/bin/bash
# Claude Code 대화 로그 날짜별 자동 동기화

REPO="C:/Users/user/DAS-claudecode"
SOURCE="C:/Users/user/.claude/projects/C--Users-user"
DATE=$(date +"%Y-%m-%d")
DEST="$REPO/conversations/$DATE"

mkdir -p "$DEST"
cp "$SOURCE"/*.jsonl "$DEST/" 2>/dev/null

cd "$REPO" || exit

# 변경사항 있을 때만 커밋
if ! git diff --quiet || git ls-files --others --exclude-standard | grep -q .; then
  git add .
  git commit -m "[$DATE] 대화 로그 업데이트"
  git push
fi

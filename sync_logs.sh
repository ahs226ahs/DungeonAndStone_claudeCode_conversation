#!/bin/bash
# DAS 게임 개발 대화 로그만 날짜별 동기화
# Claude Code를 C:/Users/user/DungeonAndStone 에서 실행했을 때 생성되는 대화만 가져옴

REPO="C:/Users/user/DAS-claudecode"
DATE=$(date +"%Y-%m-%d")

# DAS 관련 프로젝트 폴더만 지정
SOURCES=(
  "C:/Users/user/.claude/projects/c--Users-user-DAS"
  "C:/Users/user/.claude/projects/c--Users-user-DAS3D"
  "C:/Users/user/.claude/projects/c--Users-user-DungeonAndStone"
)

for SOURCE in "${SOURCES[@]}"; do
  if [ -d "$SOURCE" ]; then
    FOLDER_NAME=$(basename "$SOURCE")
    DEST="$REPO/conversations/$DATE/$FOLDER_NAME"
    mkdir -p "$DEST"
    cp "$SOURCE"/*.jsonl "$DEST/" 2>/dev/null
  fi
done

cd "$REPO" || exit

if ! git diff --quiet || git ls-files --others --exclude-standard | grep -q .; then
  git add .
  git commit -m "[$DATE] DAS 대화 로그 업데이트"
  git push
fi

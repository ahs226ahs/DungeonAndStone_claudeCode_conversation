# DAS Claude Code 대화 로그

던전 앤 스톤 팬게임 개발 중 Claude Code와의 대화 기록입니다.

## 폴더 구조

```
conversations/   ← Claude Code 대화 로그 (.jsonl)
```

## JSONL 파일 읽는 법

각 줄이 하나의 메시지입니다. `role` 필드로 발화자를 구분합니다.
- `"role": "user"` → 사용자 입력
- `"role": "assistant"` → Claude 응답

## 관련 프로젝트

- Unity 프로젝트: `C:/Users/user/DungeonAndStone`
- 기획 문서: `DungeonAndStone/Assets/_Docs/`

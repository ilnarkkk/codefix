#!/usr/bin/env bash

#не забудь указать аргументом имя ветки от которой отделилась твоя текущая рабочая ветка,
#нужно чтобы определить весь диапазон коммитов ветки.
#пример - sh fix_branch_files.sh master

RED='\033[0;31m'
NC='\033[0m'

if [ -z "$1" ]; then
  echo "${RED}Не указано имя ветки от которой отделилась твоя текущая рабочая ветка.${NC}"
  exit 1
fi

FIRST_COMMIT_SHA=$(git cherry $1 | head -n 1 | cut -c 3-)
echo ${FIRST_COMMIT_SHA}

if [ -n "${FIRST_COMMIT_SHA}" ]; then
  CHANGED_FILES=$(git diff --name-only --diff-filter=ACMRTUXB "${FIRST_COMMIT_SHA}"^..HEAD)
  echo "${CHANGED_FILES}"

  ./vendor/bin/php-cs-fixer fix -vvv --config=.php-cs-fixer.php --show-progress=dots --using-cache=no $(printf -- '--path-mode=intersection\n--\n%s' "${CHANGED_FILES}")
else
  echo "${RED}В ветке не найдены коммиты.${NC}"
fi

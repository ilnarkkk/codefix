#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'

CHANGED_FILES=$(git diff HEAD --name-only)
echo "${CHANGED_FILES}"

if [ -n "${CHANGED_FILES}" ]; then
#  ./vendor/bin/php-cs-fixer fix -vvv --config=.php-cs-fixer.php --show-progress=dots --using-cache=no $(printf -- '--path-mode=intersection\n--\n%s' "${CHANGED_FILES}")
  ./vendor/bin/php-cs-fixer fix -vvv --config=.php-cs-fixer.php --show-progress=dots --using-cache=no $(printf -- '--path-mode=intersection -- %s' "${CHANGED_FILES}")
else
  echo "${RED}Не найдено измененных файлов.${NC}"
fi

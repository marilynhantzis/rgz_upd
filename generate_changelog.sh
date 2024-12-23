   #!/bin/bash
   
   TAG=$(git describe --tags --abbrev=0)
   DATE=$(date +%Y-%m-%d)
   VERSION="v1.0.0"  # Замените на номер версии.

   # Создадим новую секцию changelog
   echo "## [$VERSION] - $DATE" >> changelog.md

   # Получаем коммиты после последнего тега
   COMMITS=$(git log $TAG..HEAD --pretty=format:"%s [%h]")

   # Добавляем коммиты в changelo
   while IFS= read -r commit; do
       echo "- $commit" >> changelog.md
   done <<< "$COMMITS"
   

## Code style

Проверка стиля кода основана на стандарте PER https://www.php-fig.org/per/coding-style/

и на библиотеке https://github.com/PHP-CS-Fixer/PHP-CS-Fixer

### Использование

Для удобства можно установить pre-commit хук в папку гита:
```
cp ./storage/cs/pre-commit.sample ./.git/hooks/pre-commit
```
Есть 2 вида автоформатирования стиля кода:

```
composer csu
```
для автоформатированния незакоммиченных файлов.

```
composer csb base_branch_name
```
для автоформатированния всех измененных файлов во всех коммитах в рабочей ветке, где `base_branch_name` нужно заменить на имя ветки от которой отделилась текущая рабочая ветка,например `composer csb master`.

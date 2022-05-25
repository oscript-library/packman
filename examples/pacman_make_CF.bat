:: %1 - Номер версии в хранилище
:: %2 - Наименование направления БД в репозитории (bp, zup)
:: %3 - Название компании, чей репозиторий, если он не общий (someone, anyone)

@echo off
@chcp 65001>nul

:: Установка имен для: каталога хранилища, файла манифеста и каталога создания дистрибутива
@set db_name=%3_%2
@if [%3] == [] (@set db_name=%2)


:: Адрес БД
@set DataBase=/SApp1C\container_%2
:: Авторизация в БД (эти же данные использую для доступа в хранилище)
@set User=AdminUser
@set Pass=AdminPass

@echo.
@echo 1. Установка настроек доступа к БД
@call packman set-database %DataBase% -db-user %User% -db-pwd %Pass%


:: Версия 1С для запуска
@set v8Ver="-v8version 8.3.21.1302"
:: Адрес хранилища
@set RepoUrl=tcp://localhost/%db_name%
:: Файл для записи доп. информации (версия хранилища, коммит)
@set versionfile=.\%db_name%.vers

@echo.
@echo 2. Загрузка конфигурации из хранилища
@call packman load-storage %RepoUrl% -storage-user %User% -storage-pwd %Pass% %v8Ver% -storage-v %1 -details %versionfile%


@echo.
@echo 3. Снятие с поддержки конфигурации в БД
@call packman drop-support %v8Ver%


@echo.
@echo 4. Создание файла поставки
@call packman make-cf %v8Ver%


:: Файл ранее созданного манифеста с помощью обработки из каталога библиотеки ./tools/ПомощникСозданияМанифестаПоставки.epf
@set FileEdf=./%db_name%.edf
:: Каталог для сохранения файлов поставки дистрибутива
@set DistFile=./file_%db_name%
:: Использование файла с версией хранилища (-prop-files) может быть заменено установкой переменной
::@set VPACKMAN_BUILDVARS=НомерВерсииХранилища=%1

@echo.
@echo 5. Создание дистрибутива в виде файлов
@call packman make-dist %FileEdf% -out %DistFile% -files %v8Ver% -prop-files %versionfile%

:: Подсчет hash-суммы файла
@FORFILES /P %DistFile% /S /M *.cf /C "cmd /c CertUtil -hashfile @file MD5 > @file.md5"


:: Каталог для сохранения файлов setup дистрибутива
::@set DistSetup=./setup_%db_name%

::@echo.
::@echo Создание дистрибутива в виде установочного файла
::@call packman make-dist %FileEdf% -out %DistSetup% -setup %v8Ver%


:: Каталог для сохранения архива с файлами поставки дистрибутива
@set DistZip=./zip_%db_name%

@echo.
@echo 6. Создание архива дистрибутива
@call packman zip-dist -in %DistFile% -out %DistZip%

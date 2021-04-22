# Vanessa Packman

Сей волшебный инструмент позволяет автоматизировать сборку тиражных релизов 1С:Предприятие 8.

Обсудить [![Join the chat at https://gitter.im/EvilBeaver/oscript-library](https://badges.gitter.im/EvilBeaver/oscript-library.svg)](https://gitter.im/EvilBeaver/oscript-library?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![GitHub release](https://img.shields.io/github/release/oscript-library/packman.svg)](https://github.com/oscript-library/packman/releases) [![Build Status](http://build.oscript.io/buildStatus/icon?job=oscript-library/packman/develop)](http://build.oscript.io/job/oscript-library/job/packman/job/develop/) 


## Возможности

* Собирать конфигурацию из исходников
* Или добывать ее из хранилища
* Формировать из добытой версии файлы поставки (закрытый от изменений CF)
* Формировать простейший манифест сборки релиза
* Формировать штатный платформенный setup.exe, такой же, каким распространяются типовые конфигурации 1С

## Вкусняшки

Полный цикл сборки релиза. От исходников в git до тиражируемого дистрибутива, который устанавливается в каталог шаблонов системы.

## Инструкция по применению

    packman help

## Важно!

При использовании существующей ИБ в качестве рабочей (например, формирование поставки непосредственно с тестового или боевого контура), будьте внимательны при использовании команд:
 - load-storage - Загрузить в рабочую среду из хранилища
 - drop-support - Снять с поддержки
 
 так как эти команды вносят изменения непосредственно в информационную базу

### Более подробная инструкция

На текущий момент отсутствует, как класс. Спрашивайте в [gitter](https://gitter.im/EvilBeaver/oscript-library)

Есть бесплатный вебинар [Открытый инструментарий счастливого 1С-ника](https://youtu.be/RuFXBLzch2o)


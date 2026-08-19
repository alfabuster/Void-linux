Шаг 1. Установка всех зависимостей разом

Одной командой мы ставим инструменты сборки, заголовочные файлы (-devel) для всех нужных функций (звук, контакты, плагины) и runtime-компоненты (порталы и поисковый движок), чтобы приложение корректно интегрировалось в систему и не падало.

Открой терминал и выполни:

```Bash
sudo xbps-install -S \
base-devel meson ninja pkg-config vala cmake gobject-introspection \
gtk4-devel libadwaita-devel glib-devel json-glib-devel sqlite-devel \
libdex-devel libpeas2-devel libportal-devel gnutls-devel \
evolution-data-server-devel libphonenumber-devel pulseaudio-devel \
xdg-desktop-portal xdg-desktop-portal-gtk tracker3 tracker3-miners libstemmer
```
Шаг 2. Загрузка исходного кода и сборка

Клонируем репозиторий и запускаем сборку с помощью Meson и Ninja:

```Bash
# Скачиваем исходники
git clone https://github.com/andyholmes/valent.git
cd valent

# Конфигурируем проект (теперь он пройдет с первого раза)
meson setup build

# Собираем
ninja -C build

# Устанавливаем в систему
sudo ninja -C build install
```


Шаг 3. Обновление кэша системных библиотек

Поскольку основная библиотека libvalent устанавливается в /usr/local/lib, нужно принудительно обновить кэш линкера, чтобы система сразу её увидела и приложение запустилось с ярлыка:

```Bash
sudo ldconfig
```

Шаг 4. Подготовка базы данных Tracker (опционально, но рекомендуется)

Чтобы избежать крашей при первой попытке смартфона синхронизировать контакты, инициализируем базу данных Tracker:

```Bash
tracker3 reset -s
```

Шаг 5. Настройка автозапуска в Niri (чтобы Valent всегда работал в фоне)

Поскольку тебе нужно, чтобы телефон подключался к ноутбуку автоматически при включении, Valent должен стартовать вместе с системой.

Открой конфигурационный файл Niri:

```Bash
nvim ~/.config/niri/config.kdl
```
И добавь в начало файла (в блок spawn-at-startup) команду для тихого запуска Valent:
Фрагмент кода
```
spawn-at-startup "valent" "--gapplication-service"
```
Флаг --gapplication-service запускает программу в фоновом режиме без открытия главного окна, так что она просто будет висеть в памяти и ждать подключения телефона.

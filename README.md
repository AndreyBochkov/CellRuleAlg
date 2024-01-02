<h2>Cell Rule Algorithm</h2>
<ul>
Однажды я сидел и играл с клеточными автоматами. Создал такой, в котором на каждом ходу каждая закрашенная клетка превращается в какой-то рисунок, правило, состоящее из некоторого количества закрашенных клеток. Проиграв несколько ходов, я заметил несколько закономерностей:
    <li>"Нулевой" ход - точка посередине поля</li>
    <li>Первый ход - рисунок из правила по центру</li>
    <li>Второй ход - немного "разъехавшийся" рисунок из правила по центру</li>
    <li>Третий ход - непредсказуемый узор</li>
    <li>Четвёртый ход - ещё более "разъехавшийся" рисунок из правил</li>а
    <li>Пятый ход - периодический узор</li>
    <li>Шестой ход - "разъехавшийся" узор из третьего хода</li>
    <li>Седьмой ход - непредсказуемый узор</li>
Такие закономерности характерны для любого правила. Попробуйте сами!
</ul>

<ol>
Как открыть:
<li>Скачать и распаковать версию Processing 3.5.4/выше.<br>
 (открыть оффициальный сайт processing.org, перейти по ссылке на кнопке "Download").<br>
!!!Внимание!!! Вы можете установить Processing в любую папку, но рекомендую создать на диске одноименную папку (C:\\Processing\), куда вы распакуете архив с Processing.</li>
<li>Двойным щелчком в файловом менеджере открыть файл CRA5x5.pde в папке CRA5x5.</li>
!!!Внимание!!! Вынимать файл из папки не советую, иначе Processing не сможет корректно распознать файл. Подходят ТОЛЬКО файлы .pde в одноименных папках.</li>
<li>В появившемся окне прочитать инструкцию сверху (серый текст) или прочитать инструкцию здесь и нажать кнопку со стрелочкой вправо "Запустить"/"Play". Появится окно с запущеной программой</li>
</ol>
<h2>Инструкция</h2>
<ul>
Управление:
  <li>Нажатие любой клавиши мыши на маленькой сетке 5x5 - правиле - слева: изменение правила и пересчёт симуляции.</li>
  <li>Клавиши "+" и "-": просмотр всех ходов симуляции от первого до седьмого (дальше моя программа симуляцию не рассчитывает). Номер просматривого хода - маленькое число слева поля симуляции.</li>
  <li>Клавиша Escape/Alt+F4 - выход из программы.</li>
</ul>

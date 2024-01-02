/*
Автор: Бочков Андрей.
Программа "Cell Rule Algorithm"
Управление:
  Нажатие любой клавиши мыши на маленькой сетке 5x5 - правиле - слева: изменение правила и пересчёт симуляции.
  Клавиши "+" и "-": просмотр всех ходов симуляции от первого до седьмого (дальше моя программа симуляцию не рассчитывает). Номер просматривого хода - маленькое число слева поля симуляции.
  Клавиша Escape/Alt+F4 - выход из программы.
*/

boolean[][] matrix = new boolean[5][5]; //Правило
boolean[][][] results = new boolean[7][29][29]; //Запись всех семи ходов
byte index = 6; //Отображаемый ход минус один (index = 0 => отображается первый ход; 1 => второй;...)

void setup() {
  fullScreen();
  background(0);
  stroke(128);
  grid(matrix, 0, 5, 30, 30);
}

void draw() {}

void trueDraw() {
  if (mouseX > 30 && mouseY > 30 && mouseX < 180 && mouseY < 180) {
    matrix[ceil((mouseY-30)/30)][ceil((mouseX-30)/30)] = !matrix[ceil((mouseY-30)/30)][ceil((mouseX-30)/30)]; //Изменяем правило
    
    //Оптимизированная версия (рез-т точно такой же, как и после рассчёта неоптимизированной версией программы, но нагрузка на процессор меньше).
    for (byte i = 0; i < 5; i ++) {
      for (byte j = 0; j < 5; j ++) {
        results[0][12+i][12+j] = matrix[i][j]; //"Раздутые" ходы можно заполнить из правила
        results[1][10+i*2][10+j*2] = matrix[i][j];
        results[3][6+i*4][6+j*4] = matrix[i][j];
      }
    }
    results[2] = calc(results[1]); //Непредсказуемый узор (ход 3)
    results[4] = calc(results[3]); //Периодический узор (ход 5)
    for (byte i = 0; i < 13; i ++) {
      for (byte j = 0; j < 13; j ++) {
        results[5][2+i*2][2+j*2] = results[2][8+i][8+j]; //"Раздутый" третий ход
      }
    }
    results[6] = calc(results[5]); //Непредсказуемый узор (ход 7)
    graphics();
    
    /*
    //Неоптимизированная версия.
    for (int i = 0; i < 29; i ++) {
      for (int j = 0; j < 29; j ++) {
        results[0][i][j] = false;
      }
    }
    results[0][14][14] = true; //Точка по центру
    results[0] = calc(results[0]); //Рассчёт каждого хода исходя из предыдущего
    results[1] = calc(results[0]);
    results[2] = calc(results[1]);
    results[3] = calc(results[2]);
    results[4] = calc(results[3]);
    results[5] = calc(results[4]);
    results[6] = calc(results[5]);
    graphics();
    */
  }
}

void grid(boolean[][] arr, int st, int en, int xC, int yC) { //Ф-ция отрисовки булевого массива в виде сетки
  for (int j = st; j < en; j ++) {
    for (int i = st; i < en; i ++) {
      if (arr[i][j]) {
        fill(255);
      } else {
        fill(0);
      }
      rect(xC + 30*(j-st), yC + 30*(i-st), 30, 30);
    }
  }
}

void graphics() {
  background(0);
  grid(matrix, 0, 5, 30, 30);
  grid(results[index], 0, results[index].length, 210, 30);
  fill(255);
  text(index+1, 200, 40);
}

boolean[][] calc(boolean[][] start) { //Ф-ция рассчёта (замены каждой закрашенной точки рисунком из правила)
  boolean[][] tempRes = new boolean[29][29];
  for (byte j = 0; j < 29; j ++) {
    for (byte i = 0; i < 29; i ++) { //Пробегаем по всему массиву
      if (start[i][j]) { //Нашли закрашенную точку!!!
        for (byte mj = 0; mj < 5; mj ++) {
          for (byte mi = 0; mi < 5; mi ++) { //Пробегаем по правилу и рисуем его заместо точки
            if (matrix[mi][mj]) {
              tempRes[i+(mi-2)][j+(mj-2)] = !tempRes[i+(mi-2)][j+(mj-2)];
            }
          }
        }
      }
    }
  }
  return tempRes;
}

void mouseReleased() {
  trueDraw(); //Делаем перерассчёт только если пользователь кликает
}

void keyPressed() {
  if (key == '-') { //Изменение отображаемого ходя симуляции
    index --;
  } else if (key == '+') {
    index ++;
  }
  if (index == 7) {
    index = 6;
  } else if (index == -1) {
    index = 0;
  }
  graphics();
}

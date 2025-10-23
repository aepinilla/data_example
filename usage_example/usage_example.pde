Table table;
int nRows;

float [] appUsageTime;
float [] screenOnTime;

void setup() {
  size(1000, 700);
  table = loadTable("user_behavior_dataset.csv", "header");
  nRows = table.getRowCount();
  println(nRows);
  // Inicializar los arrays
  appUsageTime = new float[nRows];
  screenOnTime = new float[nRows];

  // Asignar valores a cada uno de los espacio dentro de los arrays
  for (int i = 0; i < nRows; i++) {
    appUsageTime[i] = table.getFloat(i, "App Usage Time (min/day)");
    screenOnTime[i] = table.getFloat(i, "Screen On Time (hours/day)");
  }
}

void draw() {
  background(255);
  // map(              value, start1, stop1, start2, stop2)
  for (int i = 0; i < nRows; i++) {
    float x = map(screenOnTime[i], 0, max(screenOnTime), 0, width);
    float y = map(appUsageTime[i], 0, max(appUsageTime), height, 0);
    
    float r = random(20, 100);
    float g = random(50, 100);
    float b = random(50, 150);
    fill(r, g, b);
    noStroke();
    circle(x, y, 10);
  }
}

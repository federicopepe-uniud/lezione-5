IntDict province, tipologie;

IntDict belluno, padova, rovigo, treviso, venezia, verona, vicenza;

PImage mappa;

void setup() {
  size(800, 800);
  background(255);
  
  mappa = loadImage("mappa_veneto.png");
  image(mappa, 50, 50);
  
  getData();
  
  // 
  int dataMin = min(province.valueArray());
  int dataMax = max(province.valueArray());
  int rangeMin = 25;
  int rangeMax = 100;
  
  int value;
  float diameter;
  noStroke();
  fill(255, 0 , 0);
  // BELLUNO
  value = province.get("BELLUNO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(480, 180, diameter, diameter);
  // PADOVA
  value = province.get("PADOVA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(405, 540, diameter, diameter);
  // ROVIGO
  value = province.get("ROVIGO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(410, 660, diameter, diameter);
  // TREVISO
  value = province.get("TREVISO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(500, 370, diameter, diameter);
  // VENEZIA
  value = province.get("VENEZIA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(540, 530, diameter, diameter);
  // VERONA
  value = province.get("VERONA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(190, 520, diameter, diameter);
  // VICENZA
  value = province.get("VICENZA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  ellipse(310, 410, diameter, diameter);
  
  //println(province);
}

void draw() {
}

void mousePressed() {
  println(mouseX, mouseY);
}

void getData() {
  Table tabella;
  
  // Variabili per accedere comodamente alle colonne del CSV
  int colProvince = 0;
  // int colComune = 1;
  int colTipologia = 2;
  
  tabella = loadTable("data.csv", "header");

  province = new IntDict();
  tipologie = new IntDict();

  // Inizializzare tutti gli IntDict delle province
  belluno = new IntDict();
  padova = new IntDict();
  rovigo = new IntDict();
  treviso = new IntDict();
  venezia = new IntDict();
  verona = new IntDict();
  vicenza = new IntDict();

  // Lettura righe file csv
  for (int i = 0; i < tabella.getRowCount(); i++) {
    // println(tabella.getString(i, colProvince));
    String provincia = tabella.getString(i, colProvince);
    String tipologia = tabella.getString(i, colTipologia);
    province.increment(provincia);
    tipologie.increment(tipologia);
    switch(provincia) {
    case "BELLUNO":
      belluno.increment(tipologia);
      break;
    case "PADOVA":
      padova.increment(tipologia);
      break;
    case "ROVIGO":
      rovigo.increment(tipologia);
      break;
    case "TREVISO":
      treviso.increment(tipologia);
      break;
    case "VENEZIA":
      venezia.increment(tipologia);
      break;
    case "VERONA":
      verona.increment(tipologia);
      break;
    case "VICENZA":
      vicenza.increment(tipologia);
      break;
    } // chiude case
  }
  println("*** DATA LOADED ***");
}
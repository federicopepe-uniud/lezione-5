Table tabella;
// Creo una variabile IntDict per i totali di Provincia e Tipologia.
IntDict province, tipologie;
// Creo una variabile IntDict per ciascuna provincia
IntDict belluno, padova, rovigo, treviso, venezia, verona, vicenza;
// Variabili per accedere comodamente alle colonne del CSV
int colProvince = 0;
int colComune = 1;
int colTipologia = 2;

void setup() {
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
  for(int i = 0; i < tabella.getRowCount(); i++) {
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
  println(belluno);
  tipologie.sortValuesReverse();
  println(province);
  println(tipologie);
  
}

void draw() {
}
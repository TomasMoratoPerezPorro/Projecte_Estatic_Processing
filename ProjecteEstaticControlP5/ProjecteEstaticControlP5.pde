/// Projecte 1 Tomàs Morató Pérez-Porro
// CITM 05/01/2020


import controlP5.*;

int maxN=10;
int n=0;
PVector[] p = new PVector[maxN];
PVector[] v = new PVector[maxN];
float R, G, B, Rd, Gd, Bd;
Grid grid;

ControlP5 cp5;
boolean dibuixaGUI;
Button add;
Button guarda;
boolean pausa;
boolean guardaImatge;

//////VARIABLES MEVES
int columnes;
int files;
int size;

boolean dibuixaLinies;
boolean dibuixaLiniesDiagonals;
boolean randomitzar;
int desplasament;
boolean resetGrid;
boolean fondo;
boolean colorDots;
boolean randomSize;
boolean allowrandom;


void setup() {
  //Aquest Sketch adapta la mida del grid base al tamany del canvas.
  size(1080, 720);
  grid = new Grid(5, 5);
  pausa=false;
  cp5 = new ControlP5(this);

  // crear tots els controladors
  // parametres:

  cp5.addSlider("vermell")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 50)
    .setSize(128, 14)
    ;

  cp5.addSlider("verd")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 90)
    .setSize(128, 14)
    ;

  cp5.addSlider("blau")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 130)
    .setSize(128, 14);


  cp5.addToggle("dibuixaLiniesDiagonals")
    .setPosition(width-180, 200)
    .setSize(14, 14)
    .setValue(false)
    ;

  cp5.addToggle("dibuixaLinies")
    .setPosition(width-180, 240)
    .setSize(14, 14)
    .setValue(false)
    ;

  cp5.addToggle("randomitzar")
    .setPosition(width-180, 300)
    .setSize(14, 14)
    .setValue(false)
    ;

  cp5.addButton("reset")
    .setValue(0)
    .setPosition(width-100, 300)
    .setSize(30, 14)
    ;


  cp5.addSlider("soroll")
    .setRange(-30, 30)
    .setValue(3)
    .setPosition(width-180, 330)
    .setSize(128, 14)
    ;
    
 /// Per als effectes de punts es pot canviar el valor de columnes i files màxim per a omplir tot el canvas

  cp5.addSlider("sliderCol")
    .setRange(2, 20)
    .setValue(5)
    .setPosition(width-180, 390)
    .setSize(128, 14)
    ;

  cp5.addSlider("sliderFil")
    .setRange(2, 20)
    .setValue(5)
    .setPosition(width-180, 420)
    .setSize(128, 14)
    ;

  cp5.addSlider("sliderSize")
    .setRange(0, 100)
    .setValue(20)
    .setPosition(width-180, 470)
    .setSize(128, 14)
    ;
    
  cp5.addButton("randomsize")
    .setValue(0)
    .setPosition(width-180, 500)
    .setSize(30, 14)
    ;
    
  cp5.addToggle("allowrandom")
    .setPosition(width-130, 500)
    .setSize(14, 14)
    .setValue(false)
    ;

  cp5.addSlider("vermellDOT")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 530)
    .setSize(128, 14)
    ;

  cp5.addSlider("verdDOT")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 550)
    .setSize(128, 14)
    ;

  cp5.addSlider("blauDOT")
    .setRange(0, 255)
    .setValue(100)
    .setPosition(width-180, 570)
    .setSize(128, 14);


  cp5.addButton("guarda")
    .setValue(0)
    .setPosition(width-100, height-100)
    .setSize(30, 14)
    ;

  cp5.addToggle("fondo")
    .setPosition(width-180, height-100)
    .setSize(20, 20)
    .setValue(true)
    ;

  cp5.addToggle("colorDots")
    .setPosition(width-80, 590)
    .setSize(20, 20)
    .setValue(false)
    ;

  dibuixaGUI = false;
  cp5.setAutoDraw(false);
  guardaImatge = false;
  randomSize=false;
  resetGrid = false;
  dibuixaLinies = false;
  
}

void draw() {

  // ---------------------------------- 
  // AQUI POSAR EL VOSTRE DIBUIX

  if (fondo==true) {    

    background(R, G, B);
  }

  if (colorDots) {
    //background(Rb, Gb, Bb);
    grid.changeColourDots((int)Rd, (int)Gd, (int)Bd);
    //fondo=false;
    //grid.changeColourDots((int)R,(int)G,(int)B);
  }

  if (randomitzar) {
    grid.addNoiseY(desplasament);
  }
  
  if(allowrandom==false){
    grid.changesize(size);
  }

  



  grid.dibuixa();



  // ------------------------------------

  if (guardaImatge) {
    saveFrame("saved/img_####.png");
    println("Pressed save");
    guardaImatge = false;
  }
  
  if (randomSize) {
    grid.changesizeRand(30);
    println("Pressed randomise if");
    randomSize = false;
  }

  if (resetGrid) {
    println("Pressed reset");
    grid = new Grid(files, columnes);
    //grid.dibuixa();
    resetGrid = false;
  }

  if (dibuixaLinies) {
    grid.dibuixaLiniesSim();
    grid.dibuixa();
  }

  if (dibuixaLiniesDiagonals) {
    grid.dibuixaLinies();
    grid.dibuixa();
  }

  if (dibuixaGUI) 
    cp5.draw();
}

// utilitzem el valor que enviem des del sliderR per canviar la variable que volguem.
void vermell(int valor) {
  R = valor;
}

void verd(int valor) {
  G = valor;
}

void blau(int valor) {
  B = valor;
}

void vermellDOT(int valor) {
  Rd = valor;
}

void verdDOT(int valor) {
  Gd = valor;
}

void blauDOT(int valor) {
  Bd = valor;
}

void sliderCol(int valor) {
  columnes = valor;
}

void sliderFil(int valor) {
  files = valor;
}


void sliderSize(int valor) {
  size = valor;
}


void soroll(int valor) {
  desplasament = valor;
}



void guarda(int valor) {
  guardaImatge = true;
}

void randomsize(int valor) {
  println("Pressed randomise");
  randomSize = true;
}

void reset(int valor) {
  resetGrid = true;
}




void keyPressed() {
  if (key == 'g') {
    dibuixaGUI = !dibuixaGUI;
  }
  
  if(key == 's'){
    saveFrame("saved/img_####.png");
    println("Pressed save");
  }
  
  if(key == 'a'){
    fondo=false;
  }
  
  
}

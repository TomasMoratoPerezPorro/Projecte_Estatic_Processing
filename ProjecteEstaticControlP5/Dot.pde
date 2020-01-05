class Dot {
  PVector posicio;
  float tamany;
  int R,G,B;

  //CONSTRUCTOR
  Dot(float x, float y) {
    posicio = new PVector(x, y);
    tamany = 20;
    this.R=80;
    this.G=100;
    this.B=255;
  }

  // Dibuixa la particula
  void dibuixa() { 
    noStroke();     
    fill(this.R, this.G, this.B);
    ellipse(posicio.x, posicio.y, tamany, tamany);
  }
  
  void canviartamany(int size){
    this.tamany=size;
  }
  
  void canviarColor(int R,int G,int B){
    this.R=R;
    this.G=G;
    this.B=B;
  }
}

class Grid {
  int files;
  int columnes;
  ArrayList<Dot> dots;


  //CONSTRUCTOR
  Grid(int files, int columnes) {

    this.files = files;
    this.columnes=columnes;
    this.dots = new ArrayList<Dot>();
    float x = 0;
    float y = 0;

    float distx = width/columnes;
    float disty = height/files;

    float sumx = distx/2;
    float sumy =disty/2;


    int pos=0;


    for (int j=0; j<this.files; j++) {

      for (int i=0; i<this.columnes; i++) {
        this.dots.add(new Dot(x+sumx, y+sumy));
        //println("Dot:" + pos);
        //println("Pos x:" + x + "Pos y:" + y);
        pos++;
        x=x+distx;
      }
      y=y+disty;
      x=0;
      //println("-----");
    }
  }
  
 


  void dibuixa() {
    for (int i = 0; i < dots.size(); i++) {
      Dot part = dots.get(i);
      part.dibuixa();
    }
  }

  void dibuixaLinies() {
    for (int i = 0; i < dots.size()-1; i++) {

      Dot part1 = this.dots.get(i);
      Dot part2 = this.dots.get(i+1);

      float x1 = part1.posicio.x;
      float y1 = part1.posicio.y;
      float x2 = part2.posicio.x;
      float y2 = part2.posicio.y;
      stroke(255);
      line(x1, y1, x2, y2);
    }
  }

  void dibuixaLiniesSim() {
    int sumcol = 0;
    for (int i = 0; i < dots.size()-1; i++) {

      if (sumcol==this.columnes) {
        sumcol=0;
      }
      Dot part1 = this.dots.get(i);
      Dot part2 = this.dots.get(i+1);

      float x1 = part1.posicio.x;
      float y1 = part1.posicio.y;
      float x2 = part2.posicio.x;
      float y2 = part2.posicio.y;
      stroke(255,90);
      if (sumcol !=(this.columnes-1)) {
        line(x1, y1, x2, y2);
      }


      sumcol++;
    }
  }

  void addNoiseY(int val) {
    for (int i = 0; i < dots.size()-1; i++) {
      Dot part1 = this.dots.get(i);
      part1.posicio.y=part1.posicio.y+random(-val, val);
      while (part1.posicio.y>height-part1.tamany) {
        part1.posicio.y--;
      }
      while (part1.posicio.y<0+part1.tamany) {
        part1.posicio.y++;
      }
    }
  }
  
  void changesize(int val){
    for (int i = 0; i < dots.size(); i++){
      Dot part1 = this.dots.get(i);
      part1.canviartamany(val);
    }
  }
  
  void changesizeRand(int val){
    for (int i = 0; i < dots.size()-1; i++){
      Dot part1 = this.dots.get(i);
      part1.canviartamany((int) random(-val,val));
    }
  }
  
  void changeColourDots(int R,int G, int B){
    for (int i = 0; i < dots.size(); i++){
      Dot part1 = this.dots.get(i);
      part1.canviarColor(R,G,B);
    }
  }

  
}

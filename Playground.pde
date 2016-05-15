//////////////////////////////////////////////////////////////////////////
//
//		Playground Class
//		Created: 11/22/14 by Conor Russomanno
//		An extra interface pane for additional GUI features
//
//////////////////////////////////////////////////////////////////////////


class Playground {

  //button for opening and closing
  float x, y, w, h;
  color boxBG;
  color strokeColor;
  
  float topMargin, bottomMargin;
  float expandLimit = width/2.5;
  boolean isOpen;
  boolean collapsing;
  
// Pulse Sensor Stuff
  int count = 0;
  int heart = 0;
  int PulseWindowWidth;
  int PulseWindowHeight; 
  int PulseWindowX;
  int PulseWindowY;
  color eggshell;
  int[] PulseWaveY;      // HOLDS HEARTBEAT WAVEFORM DATA
  boolean rising;
  boolean OBCI_inited= false;
  
  OpenBCI_ADS1299 OBCI;
  
  Button collapser;

  Playground(int _topMargin) {

    topMargin = _topMargin;
    bottomMargin = helpWidget.h;

    isOpen = false;
    collapsing = true;

    boxBG = bgColor;
    strokeColor = color(138, 146, 153);
    collapser = new Button(0, 0, 20, 60, "<", 14);

    x = width;
    y = topMargin;
    w = 0;
    h = (height - (topMargin+bottomMargin))/2;
    
// Pulse Sensor Stuff
    eggshell = color(255, 253, 248);
    PulseWindowWidth = 440;
    PulseWindowHeight = 183;
    PulseWindowX = int(x)+5;
    PulseWindowY = int(y)-10+int(h)/2;
    PulseWaveY = new int[PulseWindowWidth];
    rising = true;
    for (int i=0; i<PulseWaveY.length; i++){
      PulseWaveY[i] = PulseWindowY + PulseWindowHeight/2; // initialize the pulse window data line to V/2
   }
    
  }
  
  public void initPlayground(OpenBCI_ADS1299 _OBCI){
    OBCI = _OBCI;
    OBCI_inited = true;
  }

  public void update() {
    // verbosePrint("uh huh");
    if (collapsing) {
      collapse();
    } else {
      expand();
    }

    if (x > width) {
      x = width;
    }
  }

  public void draw() {
    // verbosePrint("yeaaa");
  if(OBCI_inited){
    
   
  }
  }

  boolean isMouseHere() {
    if (mouseX >= x && mouseX <= width && mouseY >= y && mouseY <= height - bottomMargin) {
      return true;
    } else {
      return false;
    }
  }

  boolean isMouseInButton() {
    verbosePrint("Playground: isMouseInButton: attempting");
    if (mouseX >= collapser.but_x && mouseX <= collapser.but_x+collapser.but_dx && mouseY >= collapser.but_y && mouseY <= collapser.but_y + collapser.but_dy) {
      return true;
    } else {
      return false;
    }
  }

  public void toggleWindow() {
    if (isOpen) {//if open
      verbosePrint("close");
      collapsing = true;//collapsing = true;
      isOpen = false;
      collapser.but_txt = "<";
    } else {//if closed
      verbosePrint("open");
      collapsing = false;//expanding = true;
      isOpen = true;
      collapser.but_txt = ">";
    }
  }

  public void mousePressed() {
    verbosePrint("Playground >> mousePressed()");
  }

  public void mouseReleased() {
    verbosePrint("Playground >> mouseReleased()");
  }

  public void expand() {
    if (w <= expandLimit) {
      w = w + 50;
      x = width - w;
      PulseWindowX = int(x)+5;
    }
  }

  public void collapse() {
    if (w >= 0) {
      w = w - 50;
      x = width - w;
      PulseWindowX = int(x)+5;
    }
  }
};
class Button {
  float posX,posY,sizeXY;
  color offColor,hoverColor,clickColor,nowColor;
  PFont font;
  String label;
  int fontSize;
  boolean hovered=false;
  boolean clicked=false;
  float degLocal;
  AudioSnippet sound;

  Button(float x, float y, float s, color oc, int fs, float d, AudioSnippet _sound) {
    posX = x;
    posY = y;
    sizeXY = s;
    offColor = oc;
    hoverColor = blendColor(offColor,color(40),ADD);
    clickColor = blendColor(offColor,color(120),ADD);
    nowColor = offColor;
    fontSize=fs;
    font = createFont("Arial",fontSize);
    label = ""+int(d);
    degLocal = d;
    sound = _sound;
  }

  void update() {
    checkButton();
    drawButton();
  }

  void checkButton() {
    float kSize = 10;
    if(hitDetect(mouseX,mouseY,0,0,posX,posY,sizeXY,sizeXY)) {
      if(!mousePressed) {
        hovered=true;
        clicked=false;
      } 
      else if(mousePressed) {
        hovered=true;
        clicked=true;
        sound.play();
      }
    } else {
      hovered=false;
      clicked=false;
    }
  }

  void drawButton() {
    rectMode(CENTER);
    noStroke();
    if(hovered&&!clicked) {
      nowColor = hoverColor;
    }
    else if(hovered&&clicked) {
      nowColor = clickColor;
    }
    else if(!hovered&&!clicked) {
      nowColor = offColor;
    }
    fill(0,10);
    rect(posX+2,posY+2,sizeXY,sizeXY);
    fill(nowColor);
    rect(posX,posY,sizeXY,sizeXY);
    fill(0);
    textFont(font,fontSize);
    textAlign(CENTER,CENTER);
    text(label,posX,posY-(fontSize/4));
  }

  boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    w1 /= 2;
    h1 /= 2;
    w2 /= 2;
    h2 /= 2; 
    if(x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
      return true;
    } 
    else {
      return false;
    }
  }
}


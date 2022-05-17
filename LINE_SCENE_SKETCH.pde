
// Simple emulator of a "video-no-input-mixer" 
// Goal is to partially emulate the Panasonic MX50
// Modify this to work as a simple video-synth possibly w/ game-elements
//   to allow interaction between performer and computer (or another performer) 

// This is a sketch for 1 scene

// Parts of this code is built on following ITP/MT18
// Add name? what is the convention for this?

// -LMVandenBrink-

int[][] trail = new int[50][2];
float sz = 5;
int value;

void setup() {
  fullScreen();
}


void draw() {
  // background should have some static noise, 
  //     in audio there is no such thing as silence
  background(int(random(2)));

  // value switches between horizontal and vertical lines
  // make boolean 
  if (value%2==0)

  {

    // for loop idiom to have a shape leave a trail
    // array works like a buffer
    // values mouseXY are appended to array
    
    // explain why this should work this way 
    // and not through some other idiom
 
    for (int i= trail.length-1; i >= 0; i--) {
      noFill();
      float size = map(i, 0, trail.length, 50, 5 );

      stroke(map((int)random(110, 256), i, trail.length, 0, (int)random(25) ), 0, (int)random(200, 256));

      strokeWeight(0.4);
      line(0, trail[i][0], width, trail[i][0]);

      if (i == 0) {

        trail[i] = new int[] {mouseY, width};
      } else
      {
        trail[i] = trail[i-1];
      }
    }
  }

  if (value%2==1)

  {

    for (int i= trail.length-1; i >= 0; i--) {

      noFill();

      float size = map(i, 0, trail.length, 50, 5 );
      stroke(map((int)random(110, 256), i, trail.length, 0, (int)random(25) ), 0, (int)random(200, 256));

      strokeWeight(0.4);
      line(trail[i][0], 0, trail[i][0], height);

      if (i == 0) {
        trail[i] = new int[] {mouseX, height};
      } else
      {
        trail[i] = trail[i-1];
      }
    }
  }



  
  // comment out if you want to add filmbar in a video editor
  film_bar();
  noCursor();
}

void film_bar() {
  fill(0);
  noStroke();
  rect(0, 0, width, height/sz);
  rect(0, height-(height/sz), width, height-(height/sz));
}

void keyPressed() {
  if (keyCode == SHIFT)
  {
    value++;
  }
}

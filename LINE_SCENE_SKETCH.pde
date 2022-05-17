

int[][] trail = new int[50][2];
float sz = 5;
int value;

void setup() {
  fullScreen();
}


void draw() {
  background(int(random(2)));

  if (value%2==0)

  {


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

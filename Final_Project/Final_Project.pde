//libraries
import processing.sound.*;

//global vars
SoundFile deathNoise;
SoundFile winNoise;
SoundFile backgroundNoise;

boolean isMovingUp = false;
boolean isMovingDown = false;
boolean isMovingLeft = false;
boolean isMovingRight = false;
boolean collideUp = false;
boolean collideDown = false;
boolean collideLeft = false;
boolean collideRight = false;
int state = 0;

Player p1;
int xStart;
int yStart;

VertEnemy[] vertEnemyArraylvl1 = new VertEnemy[2];

VertEnemy[] vertEnemyArraylvl2 = new VertEnemy[4];

HorEnemy[] horEnemyArraylvl3 = new HorEnemy[4];

VertEnemy[] vertEnemyArraylvl4 = new VertEnemy[2];
HorEnemy[] horEnemyArraylvl4 = new HorEnemy[2];

HorEnemy[] horEnemyArraylvl5 = new HorEnemy[1];

VertEnemy[] vertEnemyArraylvl6 = new VertEnemy[4];
boolean isDead = false;

Coin coinlvl1;
Coin coinlvl2;
Coin coinlvl3;
Coin coinlvl4;
Coin coinlvl5;
Coin coinlvl6;
boolean hasCoin = false;

Goal goal;
Goal goallvl4;
Goal goallvl6;
boolean hasWon = false;
boolean levelCompleted = false;

ArrayList<Wall> wallListlvl1 = new ArrayList<Wall>();
ArrayList<Wall> wallListlvl2 = new ArrayList<Wall>();
ArrayList<Wall> wallListlvl3 = new ArrayList<Wall>();
ArrayList<Wall> wallListlvl4 = new ArrayList<Wall>();
ArrayList<Wall> wallListlvl5 = new ArrayList<Wall>();
ArrayList<Wall> wallListlvl6 = new ArrayList<Wall>();

int startTime;
int endTime;
int interval = 2000;

//setup function
void setup() {
  size(800, 600);
  xStart = 35;
  yStart = 285;
  background(240, 240, 255);

  p1 = new Player(xStart, yStart);

  deathNoise = new SoundFile(this, "R2.wav");
  winNoise = new SoundFile(this, "Boom.wav");
  backgroundNoise = new SoundFile(this, "Crazy.wav");

  for (int i = 0; i < vertEnemyArraylvl1.length; i++) {
    vertEnemyArraylvl1[0] = new VertEnemy(300, 230, 200, 400, 5);
    vertEnemyArraylvl1[1] = new VertEnemy(475, 370, 200, 400, 5);
  }

  for (int i = 0; i < vertEnemyArraylvl2.length; i++) {
    vertEnemyArraylvl2[0] = new VertEnemy(140, 180, 150, 450, 6);
    vertEnemyArraylvl2[1] = new VertEnemy(230, 420, 150, 450, 6);
    vertEnemyArraylvl2[2] = new VertEnemy(560, 180, 150, 450, 6);
    vertEnemyArraylvl2[3] = new VertEnemy(630, 420, 150, 450, 6);
  }

  for (int i = 0; i < horEnemyArraylvl3.length; i++) {
    horEnemyArraylvl3[0] = new HorEnemy(180, 135, 150, 650, 7);
    horEnemyArraylvl3[1] = new HorEnemy(620, 255, 150, 650, 7);
    horEnemyArraylvl3[2] = new HorEnemy(180, 315, 150, 650, 7);
    horEnemyArraylvl3[3] = new HorEnemy(620, 435, 150, 650, 7);
  }

  for (int i = 0; i < vertEnemyArraylvl4.length; i++) {
    vertEnemyArraylvl4[0] = new VertEnemy(110, 140, 110, 490, 4);
    vertEnemyArraylvl4[1] = new VertEnemy(660, 460, 110, 490, 4);
  }

  for (int i = 0; i < horEnemyArraylvl4.length; i++) {
    horEnemyArraylvl4[0] = new HorEnemy(140, 110, 110, 690, 4);
    horEnemyArraylvl4[1] = new HorEnemy(660, 460, 110, 690, 4);
  }

  for (int i = 0; i < horEnemyArraylvl5.length; i++) {
    horEnemyArraylvl5[0] = new HorEnemy(130, 285, 100, 670, 6);
  }

  for (int i = 0; i < vertEnemyArraylvl6.length; i++) {
    vertEnemyArraylvl6[0] = new VertEnemy(110, 140, 110, 490, 3);
    vertEnemyArraylvl6[1] = new VertEnemy(660, 460, 110, 490, 3);
    vertEnemyArraylvl6[2] = new VertEnemy(293, 250, 110, 490, 3);
    vertEnemyArraylvl6[3] = new VertEnemy(477, 350, 110, 490, 3);
  }

  coinlvl1 = new Coin(width/2, height/2);
  coinlvl2 = new Coin(width/4, height/3);
  coinlvl3 = new Coin(600, 435);
  coinlvl4 = new Coin(200, 300);
  coinlvl5 = new Coin(400, 250);
  coinlvl6 = new Coin(400, 450);

  goal = new Goal(7*width/8, 2*height/5, width/8, height/5);
  goallvl4 = new Goal(550, 250, 100, 100);
  goallvl6 = new Goal(650, 450, 50, 50);


  Wall wall0 = new Wall(0, 0, width, height/6);
  Wall wall1 = new Wall(0, 5*height/6, width, height/6);
  Wall wall2 = new Wall(0, 0, width/8, 2*height/5);
  Wall wall3 = new Wall(0, 3*height/5, width/8, 2*height/5);
  Wall wall4 = new Wall(7*width/8, 0, width/8, 2*height/5);
  Wall wall5 = new Wall(7*width/8, 3*height/5, width/8, 2*height/5);

  Wall wall6 = new Wall(3*width/8, 0, width/4, height/3);
  Wall wall7 = new Wall(3*width/8, 2*height/3, width/4, height/3);

  Wall wall8 = new Wall(250, 200, 300, 40);
  Wall wall9 = new Wall(250, 360, 300, 40);

  Wall wall10 = new Wall(150, 150, 200, 100);
  Wall wall11 = new Wall(250, 250, 300, 100);
  Wall wall12 = new Wall(150, 350, 200, 100);
  Wall wall13 = new Wall(450, 150, 200, 100);
  Wall wall14 = new Wall(450, 350, 200, 100);

  Wall wall15 = new Wall(100, 100, 275, 175);
  Wall wall16 = new Wall(100, 325, 150, 175);
  Wall wall17 = new Wall(300, 325, 200, 175);
  Wall wall18 = new Wall(550, 325, 150, 175);
  Wall wall19 = new Wall(0, 375, width, 175);
  Wall wall20 = new Wall(425, 100, 275, 175);
  Wall wall21 = new Wall(100, 100, 600, 125);

  Wall wall22 = new Wall(333, 0, 133, 400);
  Wall wall23 = new Wall(150, 200, 133, 400);
  Wall wall24 = new Wall(517, 200, 133, 400);
  Wall wall25 = new Wall(700, 200, 100, 400);

  wallListlvl1.add(wall0);
  wallListlvl1.add(wall1);
  wallListlvl1.add(wall2);
  wallListlvl1.add(wall3);
  wallListlvl1.add(wall4);
  wallListlvl1.add(wall5);

  wallListlvl2.add(wall0);
  wallListlvl2.add(wall1);
  wallListlvl2.add(wall2);
  wallListlvl2.add(wall3);
  wallListlvl2.add(wall4);
  wallListlvl2.add(wall5);
  wallListlvl2.add(wall6);
  wallListlvl2.add(wall7);

  wallListlvl3.add(wall0);
  wallListlvl3.add(wall1);
  wallListlvl3.add(wall2);
  wallListlvl3.add(wall3);
  wallListlvl3.add(wall4);
  wallListlvl3.add(wall5);
  wallListlvl3.add(wall8);
  wallListlvl3.add(wall9);

  wallListlvl4.add(wall0);
  wallListlvl4.add(wall1);
  wallListlvl4.add(wall2);
  wallListlvl4.add(wall3);
  wallListlvl4.add(wall4);
  wallListlvl4.add(wall5);
  wallListlvl4.add(wall10);
  wallListlvl4.add(wall11);
  wallListlvl4.add(wall12);
  wallListlvl4.add(wall13);
  wallListlvl4.add(wall14);

  wallListlvl5.add(wall0);
  wallListlvl5.add(wall1);
  wallListlvl5.add(wall2);
  wallListlvl5.add(wall3);
  wallListlvl5.add(wall4);
  wallListlvl5.add(wall5);
  wallListlvl5.add(wall15);
  wallListlvl5.add(wall16);
  wallListlvl5.add(wall17);
  wallListlvl5.add(wall18);
  wallListlvl5.add(wall19);
  wallListlvl5.add(wall20);
  wallListlvl5.add(wall21);

  wallListlvl6.add(wall0);
  wallListlvl6.add(wall1);
  wallListlvl6.add(wall2);
  wallListlvl6.add(wall3);
  wallListlvl6.add(wall4);
  wallListlvl6.add(wall5);
  wallListlvl6.add(wall22);
  wallListlvl6.add(wall23);
  wallListlvl6.add(wall24);
  wallListlvl6.add(wall25);
}

//draw function
void draw() {
  background(230, 230, 255);

  if (!backgroundNoise.isPlaying()) {
    backgroundNoise.amp(.2);
    backgroundNoise.play();
  }

  switch(state) {
  case 0:

    fill(0);
    textSize(30);
    text("World's Averagest Game I Guess.", width/4, 2*height/5);
    textSize(20);
    text("Press 'SPACE' to Play or Whatever.", width/3, height/2);

    hasWon = false;
    hasCoin = false;

    break;
  case 1:
    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {

      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goal);
      p1.coinCollect(coinlvl1);

      for (Wall aWall : wallListlvl1) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< vertEnemyArraylvl1.length; i++) {
        vertEnemyArraylvl1[i].render();
        vertEnemyArraylvl1[i].patrol();
        vertEnemyArraylvl1[i].hitbox();
        p1.VertEnemyDetect(vertEnemyArraylvl1[i]);
      }

      coinlvl1.render();
      coinlvl1.hitbox();

      goal.render();
      goal.hitbox();
    }

    break;


  case 2:
    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {
      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goal);
      p1.coinCollect(coinlvl2);

      for (Wall aWall : wallListlvl2) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< vertEnemyArraylvl2.length; i++) {
        vertEnemyArraylvl2[i].render();
        vertEnemyArraylvl2[i].patrol();
        vertEnemyArraylvl2[i].hitbox();
        p1.VertEnemyDetect(vertEnemyArraylvl2[i]);
      }

      coinlvl2.render();
      coinlvl2.hitbox();

      goal.render();
      goal.hitbox();
    }

    break;

  case 3:
    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {

      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goal);
      p1.coinCollect(coinlvl3);

      for (Wall aWall : wallListlvl3) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< horEnemyArraylvl3.length; i++) {
        horEnemyArraylvl3[i].render();
        horEnemyArraylvl3[i].patrol();
        horEnemyArraylvl3[i].hitbox();
        p1.HorEnemyDetect(horEnemyArraylvl3[i]);
      }

      coinlvl3.render();
      coinlvl3.hitbox();

      goal.render();
      goal.hitbox();
    }

    break;

  case 4:
    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {

      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goallvl4);
      p1.coinCollect(coinlvl4);

      for (Wall aWall : wallListlvl4) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< vertEnemyArraylvl4.length; i++) {
        vertEnemyArraylvl4[i].render();
        vertEnemyArraylvl4[i].patrol();
        vertEnemyArraylvl4[i].hitbox();
        p1.VertEnemyDetect(vertEnemyArraylvl4[i]);
      }

      for (int i = 0; i< horEnemyArraylvl4.length; i++) {
        horEnemyArraylvl4[i].render();
        horEnemyArraylvl4[i].patrol();
        horEnemyArraylvl4[i].hitbox();
        p1.HorEnemyDetect(horEnemyArraylvl4[i]);
      }

      coinlvl4.render();
      coinlvl4.hitbox();

      goallvl4.render();
      goallvl4.hitbox();
    }

    break;

  case 5:

    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {

      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goal);
      p1.coinCollect(coinlvl5);

      for (Wall aWall : wallListlvl5) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< horEnemyArraylvl5.length; i++) {
        horEnemyArraylvl5[i].render();
        horEnemyArraylvl5[i].patrol();
        horEnemyArraylvl5[i].hitbox();
        p1.HorEnemyDetect(horEnemyArraylvl5[i]);
      }

      coinlvl5.render();
      coinlvl5.hitbox();

      goal.render();
      goal.hitbox();
    }

    break;

  case 6:

    if (levelCompleted == true) {
      fill(0);
      textSize(50);
      text("Level Completed. Yipee.", width/5 - 10, 2*height/5);
      textSize(30);
      text("Press 'Space' for next level.", width/3 - 25, 2*height/3);
    } else {

      p1.render();
      p1.move();
      p1.hitbox();
      p1.win(goallvl6);
      p1.coinCollect(coinlvl6);

      for (Wall aWall : wallListlvl6) {
        aWall.render();
        aWall.hitbox();
        p1.wallDetect(aWall);
      }

      for (int i = 0; i< vertEnemyArraylvl6.length; i++) {
        vertEnemyArraylvl6[i].render();
        vertEnemyArraylvl6[i].patrol();
        vertEnemyArraylvl6[i].hitbox();
        p1.VertEnemyDetect(vertEnemyArraylvl6[i]);
      }

      coinlvl6.render();
      coinlvl6.hitbox();

      goallvl6.render();
      goallvl6.hitbox();
    }

    break;

  case 7:

    backgroundNoise.amp(1);

    for (Wall aWall : wallListlvl1) {
      aWall.render();
      aWall.hitbox();
      p1.wallDetect(aWall);
    }
    fill(0);
    textSize(80);
    text("You Win.", width/4 + 40, height/2 - 75);
    textSize(30);
    text("Press 'r' to Replay.", width/3, height/2);
    textSize(20);
    text("Or don't. I don't care.", width/3 + 30, 3*height/5);

    break;
  }
}

//keyPressed function
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      isMovingUp = true;
    }
    if (keyCode == DOWN) {
      isMovingDown = true;
    }
    if (keyCode == LEFT) {
      isMovingLeft = true;
    }
    if (keyCode == RIGHT) {
      isMovingRight = true;
    }
  }
}

//keyReleased function
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      isMovingUp = false;
    }
    if (keyCode == DOWN) {
      isMovingDown = false;
    }
    if (keyCode == LEFT) {
      isMovingLeft = false;
    }
    if (keyCode == RIGHT) {
      isMovingRight = false;
    }
  }
  if (key == ' ') {
    if (state == 0) {
      state += 1;
    }
    if (levelCompleted == true) {
      state += 1;
      levelCompleted = false;
      hasCoin = false;
      p1.x = xStart;
      p1.y = yStart;
    }
  }
  if (key == 'r') {
    if (state == 7) {
      state = 0;
      p1.x = xStart;
      p1.y = yStart;
    }
    if (state < 7 && levelCompleted == true) {
      levelCompleted = false;
      hasCoin = false;
      p1.x = xStart;
      p1.y = yStart;
    }
  }
}

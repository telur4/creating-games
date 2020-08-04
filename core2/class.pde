class Game {
    // ボールの数
    private int ballcnt;
    // 直径
    private final int[] ballDiameter = new int[12];
    // 初期座標x
    private final int[] ballXs = new int[12];
    // 初期座標y
    private final int[] ballYs = new int[12];
    // 進行速度x
    private final int[] stepXs = new int[12];
    // 進行速度y
    private final int[] stepYs = new int[12];
    
    // 画面遷移のための変数
    public String scene = "start";
    private String prevScene = "";
    // start
    // first
    // explain
    // stLevel
    // adLevel
    // standard
    // advance
    // over
    // clear
    
    //private String st = "";
    //private String ad = "";
    
    private int time;
    private int difTime;
    //private int i;
    
    // ボールの色
    private final color[] ballColors = {
        color(200, 100,  10),
        color( 10, 200, 100),
        color( 10, 100, 200),
        color(100, 100, 100),
        color(200, 200, 200),
        color(200, 200, 100),
        color(200, 100, 200),
        color(100, 200, 200),
        color(200,  10, 100),
        color(100,  10, 200),
        color(150, 150,   0),
        color(120, 120, 120)
    };
    
    // 最初のカウント画面
    //final int[] cnt = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    
    // ダメージの数が 3 ( 合計 20 分の 1 秒間分)入るとゲームオーバー ( 人間の感覚からすると一瞬)
    private int damagecnt;
    // 描画開始からの秒数 ( 10 秒で 1 カウント )
    //int tenSecondElapsed = 1;
    
    
    // common
    public void common() {
        background(255);
    }
    
    // start_scene()
    public void start_scene() {
        // プログラム開始からの経過ミリ秒（毎回増える）
        //time = millis();
        if(prevScene == "") {
            println("GET / 304  start_scene is true");
            time = millis();
            prevScene = "true";
        }
        difTime = millis() - time;
        
        textSize(40);
        textAlign(CENTER, CENTER);
        fill(0);
        text("Loaded...", width/2, height/16*13);
        
        noStroke();
        rectMode(CENTER);
        fill(0);
        rect(width/2, height/8*7, width-50, 40);
        fill(255);
        rect(width/2, height/8*7, width-60, 30);
        
        if(difTime >= 1000 * 5) {
            prevScene = "start";
            scene = "first";
        }
    }
    
    // first_scene()
    public void first_scene() {
        
        if(prevScene == "start" || prevScene == "over" || prevScene == "clear") {
            println("GET / 304  first_scene is true");
            prevScene = "true";
        }
        
        textSize(200);
        textAlign(CENTER, CENTER);
        fill(0);
        text("Game", width/2, height/3);
        
        noStroke();
        rectMode(CENTER);
        rect(width/4, height/3*2, 180, 80);
        rect(width/4*3, height/3*2, 180, 80);
        
        textSize(40);
        fill(255);
        text("Standard", width/4*1, height/3*2);
        fill(0);
        text("<< Select Mode >>", width/4*2, height/3*2);
        fill(255);
        text("Advance", width/4*3, height/3*2);
        
        if(mousePressed) {
            // シーンが最初の画面の時
            if((mouseX >= width/4-90 && mouseX <= width/4+90) && (mouseY >= height/3*2-40 && mouseY <= height/3*2+40)) {
            prevScene = "first";
            scene = "stLevel";
            }
            if((mouseX >= width/4*3-90 && mouseX <= width/4*3+90) && (mouseY >= height/3*2-40 && mouseY <= height/3*2+40)) {
            prevScene = "first";
            scene = "adLevel";
            }
        }
    }
  
    // stLevel_scene()
    public void stLevel_scene() {
        
        if(prevScene == "first") {
            println("GET / 304  stLevel_scene is true");
            prevScene = "true";
        }
        
        noStroke();
        fill(0);
        rectMode(CENTER);
        rect(width/2, height/6*2, width/2, 100);
        rect(width/2, height/6*3, width/2, 100);
        rect(width/2, height/6*4, width/2, 100);
        
        textSize(40);
        fill(255);
        text("1", width/2, height/6*2);
        text("Comming soon!", width/2, height/6*3);
        text("Comming soon!", width/2, height/6*4);
        
        fill(0);
        text("Standard Mode", width/2, height/6*1);
        text("--------------------", width/2, height/24*5);
        text("^^^ Choice Game Level ^^^", width/2, height/6*5);
        
        if(mousePressed) {
            // シーンがstモードのレベル選択画面の時
            if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*2-50 && mouseY <= height/6*2+50)) {
            //st = "one";
            prevScene = "stLevel";
            scene = "startGame";
            }
            //if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*3-50 && mouseY <= height/6*3+50)) {
            //  st = "two";
            //  scene = "standard";
            //}
            //if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*4-50 && mouseY <= height/6*4+50)) {
            //  st = "three";
            //  scene = "standard";
            //}
        }
    }
  
    // adLevel_scene()
    public void adLevel_scene() {
        
        if(prevScene == "first") {
            println("GET / 304  adLevel_scene is true");
            prevScene = "true";
        }
        
        noStroke();
        fill(0);
        rectMode(CENTER);
        rect(width/2, height/6*2, width/2, 100);
        rect(width/2, height/6*3, width/2, 100);
        rect(width/2, height/6*4, width/2, 100);
        
        textSize(40);
        fill(255);
        text("1", width/2, height/6*2);
        text("Comming soon!", width/2, height/6*3);
        text("Comming soon!", width/2, height/6*4);
        
        fill(0);
        text("Advance Mode", width/2, height/6*1);
        text("--------------------", width/2, height/24*5);
        text("^^^ Choice Game Level ^^^", width/2, height/6*5);
        
        if(mousePressed) {
            // シーンがstモードのレベル選択画面の時
            if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*2-50 && mouseY <= height/6*2+50)) {
            //ad = "one";
            prevScene = "adLevel";
            scene = "startGame";
            }
        //   if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*3-50 && mouseY <= height/6*3+50)) {
        //     ad = "two";
        //     scene = "advance";
        //   }
        //   if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*4-50 && mouseY <= height/6*4+50)) {
        //     ad = "three";
        //     scene = "advance";
        //   }
        }
    }
  
    // standard_scene()
    public void standard_scene() {
        
        if(prevScene == "startGame") {
            decideBallStandard();
            ballcnt = 0;
            damagecnt = 0;
            println("GET / 304  standard_scene is true");
            time = millis();
            prevScene = "true_st";
        }
        difTime = millis() - time;
        // if 文は消去しnoloop()を実行する

        // 10秒たったらボールを追加する
        if (frameCount % 600 == 0) { // !!!
            ballcnt++;
            //tenSecondElapsed++;
        }
        
        
        // draw関数のボールに関する処理
        drawCurrentPosition();
        
        drawMousePointer();
        
        judgeDamege();
        
        // ゲームの判定
        judgementGame();
    }
    
    // advance_scene()
    public void advance_scene() {
        
        if(prevScene == "startGame") {
            decideBallStandard();
            ballcnt = 0;
            damagecnt = 0;
            println("GET / 304  advance_scene is true");
            time = millis();
            prevScene = "true_ad";
        }
        difTime = millis() - time;
        // if 文は消去しnoloop()を実行する

        narrowScreen();

        // 10秒たったらボールを追加する
        if (frameCount % 600 == 0) { // !!!
            ballcnt++;
            //tenSecondElapsed++;
        }
        
        
        // draw関数のボールに関する処理
        drawCurrentPosition();
        
        drawMousePointer();
        
        judgeDamege();
        judgeNarrow();
        
        // ゲームの判定
        judgementGame();
    }

    private void narrowScreen() {
        fill(0);
        rectMode(CORNERS);
        rect(0, 0, 80, height);              // 左 
        rect(0, 0, width, 80);               // 上
        rect(width-80, 0, width, height);    // 右
        rect(0, height-80, width, height);   // 下
        rectMode(CENTER);
    }

    private void judgeNarrow() {
        if((mouseX >= 0 && mouseX <= 80) && (mouseY >= 0 && mouseY <= height)) {
            damagecnt++;
        }
        if((mouseX >= 0 && mouseX <= width) && (mouseY >= 0 && mouseY <= 80)) {
            damagecnt++;
        }
        if((mouseX >= width-80 && mouseX <= width) && (mouseY >= 0 && mouseY <= height)) {
            damagecnt++;
        }
        if((mouseX >= 0 && mouseX <= width) && (mouseY >= height-80 && mouseY <= height)) {
            damagecnt++;
        }
    }
  
    // over_scene()
    public void over_scene() {
        
        if(prevScene == "standard" || prevScene == "advance") {
            println("GET / 304  over_scene is true");
            time = millis();
            prevScene = "true";
        }
        difTime = millis() - time;

        // ダメージが3回( 20分の1秒間分 )入った場合はゲームオーバー
        background(0);
        fill(255);
        textSize(100);
        textAlign(LEFT);
        text("Game Over!", 10, 500);
        // noLoop() : draw()のループ処理を止める
        //noLoop();
        
        if(difTime >= 1000 * 10) {
            prevScene = "over";
            scene = "first";
        }
    }
  
    // clear_scene()
    public void clear_scene() {
        
        if(prevScene == "standard" || prevScene == "advance") {
            println("GET / 304  clear_scene is true");
            time = millis();
            prevScene = "true";
        }
        difTime = millis() - time;

        background(255);
        fill(150, 150, 0);
        textSize(100);
        textAlign(LEFT);
        text("Game Clear!", 10, 500);
        //noLoop();
        
        if(difTime >= 1000 * 10) {
            prevScene = "clear";
            scene = "first";
        }
    }
  
    // startGame_scene()
    public void startGame_scene() {
        
        if(prevScene == "stLevel" || prevScene == "adLevel") {
            //i = 10;
            println("GET / 304  startGame_scene is true");
            time = millis();
            if(prevScene == "stLevel") {
            prevScene = "true_st";
            }
            if(prevScene == "adLevel") {
            prevScene = "true_ad";
            }
        }
        difTime = millis() - time;
        
        drawCurrentTitle();
        drawMousePointer();
        
        if(difTime >= 1000 * 5) {
            if(prevScene == "true_st") {
            scene = "standard";
            prevScene = "startGame";
            }
            if(prevScene == "true_ad") {
            scene = "advance";
            prevScene = "startGame";
            }
        }
    }
  
    // タイトル表示
    private void drawCurrentTitle() {
        drawTitle();
        //countdown();
    }
  
    // カウントダウン画面の「Ready ? 」表示
    private void drawTitle() {
        fill(255, 0, 0);
        textSize(200);
        // textAlign()を使用し、「Ready?」を中央に配置
        textAlign(CENTER,CENTER);
        // text("Ready?", 150, 300);
        // 実数を指定するのではなく相対的に値を指定する
        text("Ready?", width/2, height/3);
        if(difTime >= 1000 * 3.5) {
        fill(0);
        text("Go!", width/2, height/3*2);
        }
    }
  
    // カウントダウンの数字の表示
    //void countdown() {
    //  while (i > 0) {
    //    fill(0);
    //    textSize(200);
    //    // textAlign()を使用し、「Ready?」を中央に配置
    //    textAlign(CENTER,CENTER);
    //    // text(cnt[j], 400, 600);
    //    // 実数を指定するのではなく相対的に値を指定する
    //    text(i, width/2, height/3*2);
        
    //    if(difTime >= 1000 * 1) {
    //      i--;
    //    }
    //  }
    //}
  
    // ボールの直径、初期座標、進行速度を決める
    private void decideBallStandard() {
        for(int i = 0; i < ballDiameter.length; i++) {
        ballDiameter[i] = int(random(100, 150));
        // ballXs[ballcnt] = int(random(200, 201));
        // ballYs[ballcnt] = int(random(200, 201));
        ballXs[i] = 75;
        ballYs[i] = 75;
        stepXs[i] = int(random(6, 8));
        stepYs[i] = int(random(3, 7));
        }
    }
  
    // マウスポインタの黒い円
    private void drawMousePointer() {
        fill(0);
        ellipse(mouseX, mouseY, 50, 50);
    }
  
    // draw 関数のボールに関する処理
    private void drawCurrentPosition() {
        for (int i = 0; i < ballcnt; i++) {
            changeDirection(i);
            movePosition(i);
            draw(i);
        }
    }

    // ボールが壁に当たった時のバウンドの処理
    provate void changeDirection(int i) {
        if (ballXs[i] < ballDiameter[i]/ 2 || ballXs[i] > width - ballDiameter[i] / 2) {
            stepXs[i] *= -1;
        }
        if (ballYs[i] < ballDiameter[i] / 2 || ballYs[i] > height - ballDiameter[i] / 2) {
            stepYs[i] *= -1;
        }
    }
        // ボールを移動させる処理
    private void movePosition(int i) {
        ballXs[i] += stepXs[i];
        ballYs[i] += stepYs[i];
    }

    // ボールの描画
    private void draw(int i) {
        noStroke();
        fill(ballColors[i]);
        ellipse(ballXs[i], ballYs[i], ballDiameter[i], ballDiameter[i]);
    }
  
    private void judgeDamege() {
        // ボールに当たるとダメージを受ける、その時の処理
        // draw 関数が繰り返すごとに現在表示されているボール一つ一つとの距離を計算する
        for (int i = 0; i < ballcnt; i++) {
            // dist(x1, y1, x2, y2)  : 2 点間の距離を求める processing の組み込み関数
            if (dist(ballXs[i], ballYs[i], mouseX+30, mouseY+30) <= ballDiameter[i]/2) {
                damagecnt++;
            }
        }
    }

    // ゲームの判定
    private void judgementGame() {
        if (damagecnt >= 3) {
            //scene = "over";
            if(prevScene == "true_st") prevScene = "standard";
            if(prevScene == "true_ad") prevScene = "advance";
            scene = "over";
        }
        if (difTime >= 1000 * 120) {
            //scene = "clear";
            if(prevScene == "true_st") prevScene = "standard";
            if(prevScene == "true_ad") prevScene = "advance";
            scene = "clear";
        }
    }
}

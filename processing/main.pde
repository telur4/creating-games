Game newGame;

void setup() {
    fullScreen();
    // size(1000, 1000);
    // noStroke()は移動
    frameRate(60);
    // second の加算は消去し初期値として代入

    // ボールの直径、初期座標、進行速度を決める
    //decideBallStandard();
    newGame = new Game();
}

void draw() {
    newGame.common();
    if(newGame.scene == "start")     newGame.start_scene();
    if(newGame.scene == "first")     newGame.first_scene();
    //if(newGame.scene == "explain") newGame.explain_scene();
    if(newGame.scene == "stLevel")   newGame.stLevel_scene();
    if(newGame.scene == "adLevel")   newGame.adLevel_scene();
    if(newGame.scene == "standard")  newGame.standard_scene();
    if(newGame.scene == "advance")   newGame.advance_scene();
    if(newGame.scene == "over")      newGame.over_scene();
    if(newGame.scene == "clear")     newGame.clear_scene();
    //if(newGame.scene == "wait")    newGame.wait_scene();
    if(newGame.scene == "startGame") newGame.startGame_scene();
}

void keyPressed() {
    if(key == ENTER) {
        exit();
    }
}

// start      起動画面
// first      最初の画面
// explain    説明の画面
// stLevel    stモードのレベル選択画面
// adLevel    adモードのレベル選択画面
// standard   stモードのゲーム実行画面  1,2,3
// advance    adモードのゲーム実行画面  1,2,3
// over       ゲームオーバーの画面
// clear      ゲームクリアの画面
// variable   変数集合
// function   関数集合
// wait       待機画面
// startGame  ゲームの開始画面

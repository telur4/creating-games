function Game() {
    let ballcnt;
    const ballDiameter = new Array(12);
    const ballXs = new Array(12);
    const ballYs = new Array(12);
    const stepXs = new Array(12);
    const stepYs = new Array(12);

    this.scene = "start";
    this.prevScene = "";
    let obj = this;

    let time;
    let difTime;
    const ballColors = [
        color(200, 100, 10),
        color(10, 200, 100),
        color(10, 100, 200),
        color(100, 100, 100),
        color(200, 200, 200),
        color(200, 200, 100),
        color(200, 100, 200),
        color(100, 200, 200),
        color(200, 10, 100),
        color(100, 10, 200),
        color(150, 150, 0),
        color(120, 120, 120)
    ];
    let damagecnt;

    this.common = function() {
        background(255);
    };

    this.start_scene = function() {

        if (this.prevScene === "") {
            console.log("GET / 304  start_scene is true");
            time = millis();
            this.prevScene = "true";
        }
        difTime = millis() - time;

        textSize(40);
        textAlign(CENTER, CENTER);
        fill(0);
        text("Loading...", width / 2, height / 16 * 13);

        noStroke();
        rectMode(CENTER);
        fill(0);
        rect(width / 2, height / 8 * 7, width - 50, 40);
        fill(255);
        rect(width / 2, height / 8 * 7, width - 60, 30);

        if (difTime >= 1000 * 5) {
            this.prevScene = "start";
            this.scene = "first";
        }
    };

    this.first_scene = function() {

        if (this.prevScene === "start" || this.prevScene === "over" || this.prevScene === "clear") {
            console.log("GET / 304  first_scene is true");
            this.prevScene = "true";
        }

        textSize(200);
        textAlign(CENTER, CENTER);
        fill(0);
        text("Game", width / 2, height / 3);

        noStroke();
        rectMode(CENTER);
        rect(width / 4 * 1, height / 3 * 2, 180, 80);
        rect(width / 4 * 3, height / 3 * 2, 180, 80);

        textSize(40);
        fill(255);
        text("Standard", width / 4 * 1, height / 3 * 2);
        fill(0);
        text("<< Select Mode >>", width / 4 * 2, height / 3 * 2);
        fill(255);
        text("Advance", width / 4 * 3, height / 3 * 2);
    };


    this.stLevel_scene = function() {

        if (this.prevScene === "first") {
            console.log("GET / 304  stLevel_scene is true");
            this.prevScene = "true";
        }

        noStroke();
        fill(0);
        rectMode(CENTER);
        rect(width / 2, height / 6 * 2, width / 2, 100);
        rect(width / 2, height / 6 * 3, width / 2, 100);
        rect(width / 2, height / 6 * 4, width / 2, 100);

        textSize(40);
        fill(255);
        text("1", width / 2, height / 6 * 2);
        text("Comming soon!", width / 2, height / 6 * 3);
        text("Comming soon!", width / 2, height / 6 * 4);

        fill(0);
        text("Standard Mode", width / 2, height / 6 * 1);
        text("--------------------", width / 2, height / 24 * 5);
        text("^^^ Choice Game Level ^^^", width / 2, height / 6 * 5);
    };


    this.adLevel_scene = function() {

        if (this.prevScene === "first") {
            console.log("GET / 304  adLevel_scene is true");
            this.prevScene = "true";
        }

        noStroke();
        fill(0);
        rectMode(CENTER);
        rect(width / 2, height / 6 * 2, width / 2, 100);
        rect(width / 2, height / 6 * 3, width / 2, 100);
        rect(width / 2, height / 6 * 4, width / 2, 100);

        textSize(40);
        fill(255);
        text("1", width / 2, height / 6 * 2);
        text("Comming soon!", width / 2, height / 6 * 3);
        text("Comming soon!", width / 2, height / 6 * 4);

        fill(0);
        text("Advance Mode", width / 2, height / 6 * 1);
        text("--------------------", width / 2, height / 24 * 5);
        text("^^^ Choice Game Level ^^^", width / 2, height / 6 * 5);
    };


    this.standard_scene = function() {

        if (this.prevScene === "startGame") {
            decideBallStandard();
            ballcnt = 0;
            damagecnt = 0;
            console.log("GET / 304  standard_scene is true");
            time = millis();
            this.prevScene = "true_st";
        }
        difTime = millis() - time;

        if (frameCount % 600 == 0) { // !!!
            ballcnt++;
        }

        drawCurrentPosition();
        drawMousePointer();
        judgeDamage();
        judgementGame();
    };


    this.advance_scene = function() {

        if (this.prevScene === "startGame") {
            decideBallStandard();
            ballcnt = 0;
            damagecnt = 0;
            console.log("GET / 304  advance_scene is true");
            time = millis();
            this.prevScene = "true_ad";
        }
        difTime = millis() - time;

        if (frameCount % 600 == 0) { // !!!
            ballcnt++;
        }

        narrowScreen();
        drawCurrentPosition();
        drawMousePointer();
        judgeDamage();
        judgeNarrow();
        judgementGame();
    };

    function narrowScreen() {
        fill(0);
        rectMode(CORNERS);
        rect(0, 0, 80, height); // 左 
        rect(0, 0, width, 80); // 上
        rect(width - 80, 0, width, height); // 右
        rect(0, height - 80, width, height); // 下
        rectMode(CENTER);
    }

    function judgeNarrow() {
        if ((mouseX >= 0 && mouseX <= 80) && (mouseY >= 0 && mouseY <= height)) {
            damagecnt++;
        }
        if ((mouseX >= 0 && mouseX <= width) && (mouseY >= 0 && mouseY <= 80)) {
            damagecnt++;
        }
        if ((mouseX >= width - 80 && mouseX <= width) && (mouseY >= 0 && mouseY <= height)) {
            damagecnt++;
        }
        if ((mouseX >= 0 && mouseX <= width) && (mouseY >= height - 80 && mouseY <= height)) {
            damagecnt++;
        }
    }

    this.over_scene = function() {

        if (this.prevScene === "standard" || this.prevScene === "advance") {
            console.log("GET / 304  over_scene is true");
            time = millis();
            this.prevScene = "true";
        }
        difTime = millis() - time;

        background(0);
        fill(255);
        textSize(100);
        textAlign(LEFT);
        text("Game Over!", 10, 500);

        if (difTime >= 1000 * 10) {
            this.prevScene = "over";
            this.scene = "first";
        }
    };

    this.clear_scene = function() {

        if (this.prevScene === "standard" || this.prevScene === "advance") {
            console.log("GET / 304  clear_scene is true");
            time = millis();
            this.prevScene = "true";
        }
        difTime = millis() - time;

        background(255);
        fill(150, 150, 0);
        textSize(100);
        textAlign(LEFT);
        text("Game Clear!", 10, 500);

        if (difTime >= 1000 * 10) {
            this.prevScene = "clear";
            this.scene = "first";
        }
    };

    this.startGame_scene = function() {

        if (this.prevScene === "stLevel" || this.prevScene === "adLevel") {
            console.log("GET / 304  startGame_scene is true");
            time = millis();
            if (this.prevScene === "stLevel") {
                this.prevScene = "true_st";
            }
            if (this.prevScene === "adLevel") {
                this.prevScene = "true_ad";
            }
        }
        difTime = millis() - time;

        drawCurrentTitle();
        drawMousePointer();

        if (difTime >= 1000 * 5) {
            if (this.prevScene === "true_st") {
                this.scene = "standard";
                this.prevScene = "startGame";
            }
            if (this.prevScene === "true_ad") {
                this.scene = "advance";
                this.prevScene = "startGame";
            }
        }
    };

    function drawCurrentTitle() {
        drawTitle();

    }

    function drawTitle() {
        fill(255, 0, 0);
        textSize(200);
        textAlign(CENTER, CENTER);
        text("Ready?", width / 2, height / 3);
        if (difTime >= 1000 * 3.5) {
            fill(0);
            text("Go!", width / 2, height / 3 * 2);
        }
    }

    function decideBallStandard() {
        for (let i = 0; i < 12; i++) {
            ballDiameter[i] = int(random(100, 150));
            ballXs[i] = 75;
            ballYs[i] = 75;
            stepXs[i] = int(random(6, 8));
            stepYs[i] = int(random(3, 7));
        }
    }

    function drawMousePointer() {
        fill(0);
        ellipse(mouseX, mouseY, 50, 50);
    }

    function drawCurrentPosition() {
        for (let i = 0; i < ballcnt; i++) {
            changeDirection(i);
            movePosition(i);
            draw(i);
        }
    }

    function changeDirection(i) {
        if (ballXs[i] < ballDiameter[i] / 2 || ballXs[i] > width - ballDiameter[i] / 2) {
            stepXs[i] *= -1;
        }
        if (ballYs[i] < ballDiameter[i] / 2 || ballYs[i] > height - ballDiameter[i] / 2) {
            stepYs[i] *= -1;
        }
    }

    function movePosition(i) {
        ballXs[i] += stepXs[i];
        ballYs[i] += stepYs[i];
    }

    function draw(i) {
        noStroke();
        fill(ballColors[i % 12]);
        ellipse(ballXs[i], ballYs[i], ballDiameter[i], ballDiameter[i]);
    }

    function judgeDamage() {
        for (let i = 0; i < ballcnt; i++) {
            if (int(dist(ballXs[i], ballYs[i], mouseX + 30, mouseY + 30)) <= ballDiameter[i] / 2) {
                damagecnt++;
            }
        }
    }

    function judgementGame() {
        if (damagecnt >= 3) {
            if (obj.prevScene === "true_st") {
                obj.prevScene = "standard";
            }
            if (obj.prevScene === "true_ad") {
                obj.prevScene = "advance";
            }
            obj.scene = "over";
        }
        if (difTime >= 1000 * 120) {
            if (obj.prevScene === "true_st") {
                obj.prevScene = "standard";
            }
            if (obj.prevScene === "true_ad") {
                obj.prevScene = "advance";
            }
            obj.scene = "clear";
        }
    }
}

let newGame;

function setup() {
    createCanvas(windowWidth, windowHeight);
    frameRate(60);
    newGame = new Game();
}

function draw() {
    newGame.common();
    if (newGame.scene === "start") {
        newGame.start_scene();
    }
    if (newGame.scene === "first") {
        newGame.first_scene();
    }
    //if(newGame.scene === "explain") {
    //    newGame.explain_scene();
    //}
    if (newGame.scene === "stLevel") {
        newGame.stLevel_scene();
    }
    if (newGame.scene === "adLevel") {
        newGame.adLevel_scene();
    }
    if (newGame.scene === "standard") {
        newGame.standard_scene();
    }
    if (newGame.scene === "advance") {
        newGame.advance_scene();
    }
    if (newGame.scene === "over") {
        newGame.over_scene();
    }
    if (newGame.scene === "clear") {
        newGame.clear_scene();
    }
    //if(newGame.scene === "wait") {
    //    newGame.wait_scene();
    //}
    if (newGame.scene === "startGame") {
        newGame.startGame_scene();
    }
}

function keyPressed() {
    if (key === ENTER) {
        exit();
    }
}

function mouseClicked() {
    if (newGame.scene === "first") {
        if ((mouseX >= width / 4 - 90 && mouseX <= width / 4 + 90) && (mouseY >= height / 3 * 2 - 40 && mouseY <= height / 3 * 2 + 40)) {
            newGame.prevScene = "first";
            newGame.scene = "stLevel";
        }
        if ((mouseX >= width / 4 * 3 - 90 && mouseX <= width / 4 * 3 + 90) && (mouseY >= height / 3 * 2 - 40 && mouseY <= height / 3 * 2 + 40)) {
            newGame.prevScene = "first";
            newGame.scene = "adLevel";
        }
    }
    if (newGame.scene === "stLevel") {
        if ((mouseX >= width / 2 - width / 2 / 2 && mouseX <= width / 2 + width / 2 / 2) && (mouseY >= height / 6 * 2 - 50 && mouseY <= height / 6 * 2 + 50)) {
            //st = "one";
            newGame.prevScene = "stLevel";
            newGame.scene = "startGame";
        }
        //if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*3-50 && mouseY <= height/6*3+50)) {
        //  st = "two";
        //  newGame.scene = "standard";
        //}
        //if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*4-50 && mouseY <= height/6*4+50)) {
        //  st = "three";
        //  newGame.scene = "standard";
        //}
    }
    if (newGame.scene === "adLevel") {
        if ((mouseX >= width / 2 - width / 2 / 2 && mouseX <= width / 2 + width / 2 / 2) && (mouseY >= height / 6 * 2 - 50 && mouseY <= height / 6 * 2 + 50)) {
            //ad = "one";
            newGame.prevScene = "adLevel";
            newGame.scene = "startGame";
        }
        //   if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*3-50 && mouseY <= height/6*3+50)) {
        //     ad = "two";
        //     newGame.scene = "advance";
        //   }
        //   if((mouseX >= width/2-width/2/2 && mouseX <= width/2+width/2/2) && (mouseY >= height/6*4-50 && mouseY <= height/6*4+50)) {
        //     ad = "three";
        //     newGame.scene = "advance";
        //   }
    }
}
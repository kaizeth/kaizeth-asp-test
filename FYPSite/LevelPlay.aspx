<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LevelPlay.aspx.cs" Inherits="FYPSite.LevelPlay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Canvas Maze Game</title>
    <link href="Play.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <canvas id="canvas" width="482" height="482">
This text is displayed if your browser does not support HTML5 Canvas.
        <br />
        <br />
</canvas>
        <div id="site-bottom-bar" class="fixed-position">
            <div id="site-bottom-bar-frame">
                <div id="site-bottom-bar-content">
                    <table align="center" width="100%">
                        <tr>
                            <td>
                            </td>
                            <td align="center">
    <div>
        <canvas id="c6" width="200" height="12" style="border: solid 1px #000000;"></canvas> <%--http://www.html5tutorial.info/html5-canvas-text.php--%>
    </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                    <button onclick="javascript: QuitGame(); return false;" class="func1button">QUIT</button>
                            </td>
                            <td align="center">
                    <button onclick="javascript: btnPress(1); return false; " class="func1button">Left</button>
                    <button onclick="javascript: btnPress(2); return false; " class="func1button">Up</button>
                    <button onclick="javascript: btnPress(3); return false; " class="func1button">Down</button>
                    <button onclick="javascript: btnPress(4); return false; " class="func1button">Right</button>
                            </td>
                            <td align="right">
                    <button onclick="location.reload(true);" class="func1button">RETRY</button>
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
        </div>
        <%--<noscript><INPUT type="submit" value="Go" name=submit1></noscript>--%>
    </div>
    <script type="text/javascript">
        var c6 = document.getElementById("c6");
        var c6_context = c6.getContext("2d");

        function showFillText() {
            c6_context.fillStyle = '#f00';
            c6_context.font = 'bold 10px sans-serif';
            c6_context.textBaseline = 'top';
            c6_context.fillText("Distance: " + distance, 10, 0);
//            c6_context.fillText("Coordinate: " + x + "," + y, 10, 0);
            c6_context.fillText("Duration: " + game_minute + "m " + ~ ~game_second + "s", 110, 00);
        }
        function Clear_text() {
            c6_context.clearRect(1, 1, 200, 30);
        } 
    </script>
    <script type="text/javascript">
        var canvas; //canvas vars
        var ctx;
        var dx = 5; //block moving distance
        var dy = 5;
        var x = parseInt(getUrlVars()["sx"]); //block positions
        var y = parseInt(getUrlVars()["sy"]);
        var endx = getUrlVars()["ex"];
        var endy = getUrlVars()["ey"];
        var WIDTH = 600; //maze vars
        var HEIGHT = 600;
        var img = new Image();
        var collision = 0;
        var mode = 0;
        var moving;
        var distance = 0;
        var game_second = 0;
        var game_minute = 0;
        var timerID;
        var timerflag = 0;

        function rect(x, y, w, h) {
            ctx.beginPath();
            ctx.rect(x, y, w, h);
            ctx.closePath();
            ctx.fill();
        }

        function clear() {
            ctx.clearRect(0, 0, WIDTH, HEIGHT);
            ctx.drawImage(img, 0, 0);
        }

        function init() {
            canvas = document.getElementById("canvas");
            ctx = canvas.getContext("2d");
            img.src = "maze/" + getUrlVars()["path"] + ".gif";
            return setInterval(draw, 10);

        }

        function checkcollision() {
            var imgd = ctx.getImageData(x, y, 15, 15);
            var pix = imgd.data;
            for (var i = 0; n = pix.length, i < n; i += 4) {
                if (pix[i] == 0) {
                    collision = 1;
                }
            }
        }

        function draw() {
            clear();
            ctx.fillStyle = "purple";
            rect(x, y, 15, 15);
        }
        init();

        function btnPress(direction) {
            switch (direction) {
                case 1:
                    {
                        if (mode != 1) {
                            clearTimeout(moving);
                            mode = 1;
                            left();
                        } else {
                            mode = 0;
                            clearTimeout(moving);
                        }
                    } break;
                case 2:
                    {
                        if (mode != 2) {
                            clearTimeout(moving);
                            mode = 2;
                            up();
                        } else {
                            mode = 0;
                            clearTimeout(moving);
                        }
                    } break;
                case 3:
                    {
                        if (mode != 3) {
                            clearTimeout(moving);
                            mode = 3;
                            down();
                        } else {
                            mode = 0;
                            clearTimeout(moving);
                        }
                    } break;
                case 4:
                    {
                        if (mode != 4) {
                            clearTimeout(moving);
                            mode = 4;
                            right();
                        } else {
                            mode = 0;
                            clearTimeout(moving);
                        }
                    } break;

            }
        }

        function left() {
            if (x - dx > 0) {
                x -= dx;
                clear();
                checkcollision();
                if (collision == 1) {
                    x += dx;
                    collision = 0;
                }
                else
                    distance += 5;
                startTimer();
                Clear_text();
                showFillText();
                checkClear();
            }
            moving = setTimeout("left()", 300);
        }

        function up() {
            if (y - dy > 0) {
                y -= dy;
                clear();
                checkcollision();
                if (collision == 1) {
                    y += dy;
                    collision = 0;
                }
                else
                    distance += 5;
                startTimer();
                Clear_text();
                showFillText();
                checkClear();
            }
            moving = setTimeout("up()", 300);
        }

        function down() {
            if (y + dy < HEIGHT) {
                y += dy;
                clear();
                checkcollision();
                if (collision == 1) {
                    y -= dy;
                    collision = 0;
                }
                else
                    distance += 5;
                startTimer();
                Clear_text();
                showFillText();
                checkClear();
            }
            moving = setTimeout("down()", 300);
        }

        function right() {
            if ((x + dx < WIDTH)) {
                x += dx;
                clear();
                checkcollision();
                if (collision == 1) {
                    x -= dx;
                    collision = 0;
                }
                else
                    distance += 5;
                startTimer();
                Clear_text();
                showFillText();
                checkClear();
            }
            moving = setTimeout("right()", 300);
        }

        function getUrlVars() { //http://papermashup.com/read-url-get-variables-withjavascript/
            var vars = {};
            var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
                vars[key] = value;
            });
            return vars
        }

        function checkClear() {
            if (endx - x < 5 && endx - x > -5 && endy - y < 5 && endy - y > -5) {
                clearTimeout(moving);
                clearInterval(timerID);
                var totalTime = game_minute * 60 + game_second;
                document.location.href = "LevelSubmit.aspx?id=" + getUrlVars()["id"] + "&d=" + distance + "&t=" + totalTime;
            }
        }

        function startTimer() {
            if (timerflag == 0) {
                timerflag = 1;
                timerID = setInterval("timer()", 1000);
            }
        }

        function timer() {
            ++game_second;

            if (game_second == 60) {
                game_second = 0;
                ++game_minute;
            }

            Clear_text();
            showFillText();
        }

        function QuitGame() {
            document.location.href = "LevelOverview.aspx?id=" + getUrlVars()["id"];
        }
    </script>
    </form>
</body>
</html>
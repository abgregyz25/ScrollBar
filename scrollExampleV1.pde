////variables...
float count = 20;
float x = 20;
float y = 20;
float radius = 20;
float pageLength = 0;
float pageEnd = 0;
float scrollLength = 0;
float scrollStart = 0;
float scrollEnd;
float scrollWidth = 4;
boolean scrolling = false;



////setup...
void setup() {
  size(1000, 700); 
  //fullScreen();
  background(75);
  strokeCap(PROJECT);
  strokeWeight(1);
}

////draw...
void draw() {
  background(75);
  stroke(255,175,105);
  fill(100);
  rectMode(CENTER);
  rect(width/2,height/2, 200, height);
  stroke(255);
  rectMode(CORNER);
  noFill();
  for ( int i = 0; i< count; i++) {  
    rect(x, y, radius, radius);
    y += 50;
    x += (width-60)/count;
  }
  y = y - (count*50);
  x = 20;
  pageLength = dist(0, y, 0, y + (count*50) + 20);
  scrollLength = (height/pageLength)*height;
  scrollEnd = scrollLength + scrollStart;
  noStroke();
  
  fill(135);
  rectMode(CORNER);
  rect(width-scrollWidth, 0, scrollWidth, height);
  fill(195);
  rect(width-scrollWidth, scrollStart, scrollWidth, scrollLength);
  
  if (mouseX > width-14 && mouseY > 0 && mouseY < height || scrolling == true) {
    if (scrollWidth < 14) {
      scrollWidth +=1;
    }
  } else {
    if (scrollWidth > 4) {
      scrollWidth -= 1;
    }
  }
  if (mousePressed==true) {
    if (mouseX > width-14 && mouseY > scrollStart && mouseY < scrollEnd) { 
      scrolling = true;
    }
    if (scrolling == true) {
      ellipse(50, 50, 20, 20);
      scrollStart = scrollStart - (pmouseY - mouseY);
      y = y + ((pmouseY - mouseY)/ ( height / pageLength));
    }
  } else {
    scrolling = false;
  }
  //scroll limits..
  if (scrollStart <= 0) {
    scrollStart = 0;
  }
  if (scrollStart > height - scrollLength) {
    scrollStart = height - scrollLength;
  }
  //page limits..
  if (y >= 20) {
    y = 20;
  }
  if (y < - (count*50) + height) {
    y = - (count*50) + height;
  }
  //println(pageLength);
}

////functions...

//void mousePressed(){
//  if (mouseX > width-14 && mouseY < scrollStart && mouseY < scrollEnd){
//    if(pmouseY < mouseY){

//      scrollStart = scrollStart + (mouseY - pmouseY);
//      //translate(
//    } else if (pmouseY > mouseY){
//      scrollStart = scrollStart - (mouseY - pmouseY);
//    }
//  }
//}

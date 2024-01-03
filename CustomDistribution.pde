int maxVal = 1;
int arrSize = 600;
int arr[]=new int[arrSize];

import java.time.LocalDate;


void setup(){
  size(1200,800);
  background(0);
  frameRate(60);
  
  for(int i=0;i<arrSize;i++){
    arr[i]=0;
  }
}
void draw(){
  background(0);
  fill(255);
  
  int num = customDistribution();

  
  if(num>=0 && num<arrSize){
    arr[num]++;
    if(arr[num]>maxVal){maxVal = arr[num];}
  }
  
  for(int i=0;i<arrSize;i++){
    print(arr[i]+" ");
  }
  print("\n");
  
  print(maxVal+"\n");
  
  //highest  = 800;
  // height = arr[i]/highest*800
  for(int i=0;i<arrSize;i++){
    //rect(1200/arrSize*i,800-(arr[i])/maxVal*800,1200/arrSize,(arr[i])/maxVal*800);
    rect(1200/float(arrSize)*i,800-arr[i]/float(maxVal)*800,1200/float(arrSize),arr[i]/float(maxVal)*800);
  }
  ////rectMode(DOWN);
  //rect(0,800-400,2,400);
  //noLoop();
}

int customDistribution(){
  while(true){
    float num1 = (float)random(1);
    float num2 = (float)random(1);
    
    float y=num1*num1*num1*num1*num1*num1*num1*num1*num1*num1*num1;
    
    if(num2<y){
      return int(num1*arrSize);
    }
  }
  
}

int timeOfFirstKey = 0;
LocalDate dateStamp = LocalDate.now();

void keyPressed(){
    if (keyCode == 83){ // When S is pressed
        if(timeOfFirstKey == 0 || millis()-timeOfFirstKey > 1000){ //the time when the S key is pressed first 
            timeOfFirstKey=millis();
        }
        else if(millis()-timeOfFirstKey < 1000){ //When the next time S is pressed, 'i.e. double pressed' it compares if it is within a second or not
                saveFrame("img/ss"+dateStamp+"-######.jpg"); // if so then save the screenshot
                timeOfFirstKey = 0; // reset the timer
        }
    }
}

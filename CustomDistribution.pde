int maxVal = 1;
int arrSize = 600; // change for getting different histogram bar width
int arr[]=new int[arrSize];

import java.time.LocalDate; // for saving the screenshots


void setup(){
  size(1200,800);
  background(0);
  frameRate(60);
  
}
void draw(){
  background(0);
  
  int num = customDistribution();

  
  
  arr[num]++;
  if(arr[num]>maxVal){maxVal = arr[num];} // storing the maxVal to scale the longest histogram bar
  
  // drawing the histogram
  for(int i=0;i<arrSize;i++){
    rect(1200/float(arrSize)*i,800-arr[i]/float(maxVal)*800,1200/float(arrSize),arr[i]/float(maxVal)*800);
  }
}

int customDistribution(){
  while(true){
    float num1 = (float)random(1);
    float num2 = (float)random(1);
    
    float y=num1*num1; // y = x^2
    
    if(num2<y){
      return int(num1*arrSize);
    }
  }
  
}

// screenshot code 
// Double press "S" for a screenshot
// the screenshot is saved in an img folder in the directory

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

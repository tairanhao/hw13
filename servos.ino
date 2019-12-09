

#include <VSync.h>    
#include <Servo.h>  
  
ValueReceiver<3> receiver;  

int output;
int output1;
int output2;


Servo myservo;
Servo myservo1;
Servo myservo2;

void setup()
{
 
  Serial.begin(19200);
  

  myservo.attach(8);
  myservo1.attach(9);
  myservo2.attach(10);
 
  receiver.observe(output);
  receiver.observe(output1);
  receiver.observe(output2);
}

void loop()
{
  receiver.sync();
  
  if (output < 180) {
    myservo.write(output);
  }

  if (output1 <180)
  {
    myservo1.write(output1);
  }

  
  if (output2 <180)
  {
    myservo2.write(output2);
  }
}

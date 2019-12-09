import vsync.*; // Importing the library that will help us in sending and receiving the values from the Arduino
import processing.serial.*;  // Importing the serial library

// Below libraries will connect and send, receive the values from Wekinator
import oscP5.*;  
import netP5.*;

// Creating the instances
OscP5 oscP5;
NetAddress dest;
ValueSender sender;

// These variables will be synchronized with the Arduino and they should be same on the Arduino side.
public int output;
public int output1;
public int output2;

void setup() 
{
  // Starting the serial communication, the baudrate and the com port should be same as on the Arduino side.
  Serial serial = new Serial(this, "/dev/cu.usbmodem14101", 19200);
  sender = new ValueSender(this, serial);
  
  // Synchronizing the variables as on the Arduino side. The order should be same.
  sender.observe("output");
  sender.observe("output1");
    sender.observe("output2");
  
  // Starting the communication with Wekinator. listen on port 12000, return messages on port 6448
  oscP5 = new OscP5(this, 12000); 
  dest = new NetAddress("127.0.0.1", 6448);
}

// Recieve OSC messages from Wekinator
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    // Receiving the output from Wekinator
    float value = theOscMessage.get(0).floatValue(); // First output
    float val = theOscMessage.get(1).floatValue();  
    float valu = theOscMessage.get(2).floatValue();  // Second output
    
    // Converting the output to int type
      output = int(value);
      output1 = int(val);
            output2 = int(valu);
  }
}

void draw() 
{
  //  Nothing to be drawn for this example
}

    
        

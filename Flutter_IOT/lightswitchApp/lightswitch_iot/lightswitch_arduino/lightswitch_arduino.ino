int led = 4;     // LED pin
int temp = 0; 	 // temporary variable for reading the button pin status

void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT);   // declare LED as output
}

void loop() {

  if (Serial.available()){
    char data_received; 
    data_received = Serial.read();
    temp = Serial.readString().toInt();
  }
   
     if (temp == HIGH) {
        digitalWrite(led, HIGH);
        Serial.println("LED Turned ON");
        delay(1000);
       }
     else {
        digitalWrite(led, LOW);
        Serial.println("LED Turned OFF");
        delay(1000);
       }

}

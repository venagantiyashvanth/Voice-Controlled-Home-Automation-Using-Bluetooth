#include <LiquidCrystal.h>
#include <SoftwareSerial.h>

LiquidCrystal lcd(13,12,11,10,9,8);
SoftwareSerial BT(2,3);

int relayPin = 5;
char data;

void setup()
{
  pinMode(relayPin,OUTPUT);
  digitalWrite(relayPin,HIGH);   // fan OFF

  lcd.begin(16,2);
  lcd.print("Voice Fan Ctrl");

  BT.begin(9600);
}

void loop()
{
  if(BT.available())
  {
    data = BT.read();

    if(data=='1')
    {
      digitalWrite(relayPin,LOW);
      lcd.clear();
      lcd.print("Fan ON");
    }

    if(data=='0')
    {
      digitalWrite(relayPin,HIGH);
      lcd.clear();
      lcd.print("Fan OFF");
    }
  }
}

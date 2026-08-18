### Project solution

**Task 1:** Define the project and apply design thinking

**Steps:**

- Define project goals like noise/air monitoring, awareness, and real-time visibility.
- Choose KY-037/KY-038 for sound and MQ135 for air quality.
- Plan the deployment using Arduino UNO + ESP8266 for wireless transmission.
- Design a centralized platform (web + mobile) and integrate it via Firebase.

**Task 2:** Innovate with data analytics

**Steps:**

- Firebase Realtime Database enables basic data storage and history tracking.
- Optional future work: extend with charts and noise trend analysis in Flutter/Web.

**Task 3:** Develop an IoT-enabled monitoring system

**Step 1:** Connect and configure noise sensors with Raspberry Pi or Arduino.

```text
#include <MQ135.h>
#define ANALOGPIN A0
MQ135 gasSensor = MQ135(ANALOGPIN);
 
void setup() {
  Serial.begin(9600);
}
 
void loop() {
  float air_quality = gasSensor.getPPM();
  Serial.println(air_quality);
  delay(2000);
}
```

**Step 2:** Write Python (or Arduino) scripts to collect noise-level data and timestamp it.

```text
*from flask import Flask, render_template*
*import pyrebase*

config = {
    "apiKey": "YOUR_API_KEY",
    "authDomain": "your-project.firebaseapp.com",
    "databaseURL": "https://your-project.firebaseio.com",
    "storageBucket": "your-project.appspot.com"
}


firebase = pyrebase.initialize_app(config)
db = firebase.database()


app = Flask(__name__)


@app.route('/')
def index():
    noise_level = db.child("noise_level").get().val()
    return render_template("index.html", noise_level=noise_level)


if __name__ == '__main__':
    app.run(debug=True)
```

**Step 3:** Test sensor accuracy in different noise environments (quiet room, traffic sounds, music, and so on)

- IoT sensor deployment

1. Hardware required:
i. Arduino UNO
ii. MQ135 Gas Sensor
iii. Sound Sensor (KY-037/KY-038)
iv. ESP8266 wifi Module
v. Software setup:

- Ensure arduino_sensor.ino is uploaded and data is correctly being sent to Firebase.
- Sample Arduino output:

```text
yaml
CopyEdit
Air Quality: 85.00 PPM
Noise Level: 68 dB
```

**Task 4:** Build the web platform and mobile application

**Step 1:** Deploy and program IoT sensors (Arduino UNO + MQ135 gas sensor + sound sensor + ESP8266) to capture air quality and noise data and send it via wifi.

- Connect the MQ135 sensor and sound sensor module (KY-037 or KY-038) to Arduino UNO.
- Connect ESP8266 Wi-Fi module for network communication.
- Open Arduino IDE, load arduino_sensor.ino sketch.
- Update wifi credentials inside the sketch if required.
- Upload the sketch to Arduino UNO.
- Verify sensor output in Serial Monitor (such as Air Quality in PPM).

**Step 2:** Develop backend services to fetch and display real-time data from IoT sensors (for example, using Flask or Node.js)

### Backend platform (Python + Firebase)

Dependencies: ```Flask, pyrebase4```
bash

```text
pip install Flask pyrebase4
```
 

- Run Flask app:

```text
python app.py


App.py file
-------------
from flask import Flask, render_template
import pyrebase

config = {
    "apiKey": "YOUR_API_KEY",
    "authDomain": "your-project.firebaseapp.com",
    "databaseURL": "https://your-project.firebaseio.com",
    "storageBucket": "your-project.appspot.com"
}

firebase = pyrebase.initialize_app(config)
db = firebase.database()

app = Flask(__name__)

@app.route('/')
def index():
    noise_level = db.child("noise_level").get().val()
    return render_template("index.html", noise_level=noise_level)

if __name__ == '__main__':
    app.run(debug=True)
```

- Edit config in app.py with your Firebase credentials to enable real-time database communication.

**Step 3:** Design and build the web dashboard frontend using Flask templates and Firebase to display live noise and air quality data.

**Web dashboard**

- HTML frontend integrated with Flask backend
- Open index.html (in /templates)
- View real-time noise data retrieved from Firebase

**Step 4:** Develop the mobile application frontend using Flutter, integrated with Firebase Realtime Database, to show real-time noise levels on mobile devices.

**Mobile app (Flutter)**

- Requirements:
i.Flutter SDK
ii.Firebase Realtime Database Integration
- Replace your main.dart content in your Flutter project
- Add Firebase configuration to android/app/google-services.json
- Follow Firebase-Flutter setup documentation

Main.dart file

```text
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise Monitor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NoiseMonitor(),
    );
  }
}


class NoiseMonitor extends StatefulWidget {
  @override
  _NoiseMonitorState createState() => _NoiseMonitorState();
}


class _NoiseMonitorState extends State<NoiseMonitor> {
  final dbRef = FirebaseDatabase.instance.ref();
  String noiseLevel = "Loading...";


  @override
  void initState() {
    super.initState();
    dbRef.child('noise_level').onValue.listen((event) {
      setState(() {
        noiseLevel = event.snapshot.value.toString();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noise Level')),
      body: Center(child: Text('Noise Level: $noiseLevel dB')),
    );
  }
}
```

**Sample output**

- Arduino Serial: Air Quality: 85.00 PPM
- Web UI: Noise Level: 68 dB
- Mobile App UI: "Noise Level: 68 dB" displayed in real-time.
 

 
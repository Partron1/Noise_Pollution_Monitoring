```text
Noise_Pollution_Monitoring/
├── arduino/                 # Arduino firmware for KY-037/KY-038 sound sensors
│   └── arduino_sensor.ino   # Sensor data collection (C++)
├── mobile/                  # Flutter mobile app
│   └── main.dart            # Real-time noise display
├── app.py                   # Flask backend server
├── requirements.txt         # Python dependencies (Flask, pyrebase4)
├── templates/               #Flask HTML templates
│   └── index.html           # Web dashboard (currently empty)
├── project_file/            # Documentation
│   ├── Solution.md          # Full implementation guide
│   ├── Task.md              # Project requirements
│   ├── docs.md              # References
│   └── tools.md             # Tool requirements
└── LICENSE, README.md, .gitignore
```
# Noise_Pollution_Monitoring
Design and implement an IoT-enabled noise pollution monitoring system to measure real-time sound levels in public areas. 

Monitoring noise pollution using real-time data increases public awareness, supports policy enforcement, and contributes to a better quality of life in urban environments. In this project, we designed and implemented an IoT-enabled noise pollution monitoring system to measure real-time sound levels in public areas. We integrated IoT sensors, use Python for data handling, and applied system design principles to build a scalable solution that promotes awareness and supports urban environmental planning.

### How it fits together 
The Arduino firmware reads noise levels from sound sensors and transmits them via ESP8266 Wi-Fi to Firebase Realtime Database. The Flask backend queries Firebase and serves a web dashboard via templates/index.html. The Flutter mobile app simultaneously subscribes to the same Firebase database to show live noise levels on mobile devices. All three components (firmware, backend, mobile) sync through a centralized Firebase real-time database.

### Prerequisite knowledge

- **Python programming:** A good grasp of Python fundamentals, including data structures, loops, functions, and file handling.Familiarity with libraries like requests, Flask, or tkinter (if applicable) will support app and backend development.
- **Basic electronics and IoT concepts:** Understanding how to connect and configure IoT devices (e.g., Raspberry Pi, sensors) and basic knowledge of circuit components, GPIO pin management, and network communication.
- **Embedded systems and hardware-software interaction:** Knowing how software communicates with hardware (e.g., sending/receiving data from sensors) is key for integrating the system.
- **Basic mobile or web app development:** Some experience with creating simple user interfaces and handling real-time data display will help in the app development phase.
- **Data visualization (basic):** If visualizing data is part of your app, familiarity with plotting libraries like Matplotlib or simple dashboard tools will help.
- **Networking basics:** Understanding how data is transmitted over networks (e.g., HTTP requests) will be useful for real-time updates.


### Business goals
Imagine you are a data analyst working on a smart noise pollution monitoring system. Your role is to analyze real-time noise data collected via IoT sensors to help communities and authorities better understand noise pollution. Your focus is on the following business goals:

- **Real-time public awareness:** 

Provide accurate and timely noise level data to the public through an accessible platform, raising awareness about noise pollution.

- **Regulatory support:** 

Help local authorities monitor noise levels effectively to ensure compliance with noise regulations and improve urban living conditions.

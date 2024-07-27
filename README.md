# SAHARA - Volunteer Management Service

**SAHARA** is a comprehensive volunteer management service designed for use during emergencies, operating effectively even without an internet connection. It features a web application for volunteer registration and a mobile app for emergency alerts. With integrated maps and machine learning, SAHARA enhances coordination and response during crises.

## Features

### Web Application

- **Volunteer Registration:** Allows volunteers to sign up, provide their details, and share their location.
- **Real-time Maps:** Displays disaster-prone areas, volunteer locations, and safe places using integrated maps.
- **Machine Learning Integration:** Identifies and shows safe places nearby based on ML models.
- **Data Management:** Stores volunteer information and emergency data using MongoDB.

### Flutter Mobile App

- **SOS Button:** Three types of SOS alerts:
  - **Personal Emergency:** Custom message sent to nearby volunteers.
  - **Natural Disaster Emergency:** Default message sent to all volunteers.
  - **Community Issue:** Report community-related issues.
- **Location Access:** Requires location permissions to provide accurate SOS functionality.
- **OTP Login:** Secure login using OTP for user authentication.

## Getting Started

### Prerequisites

- **Web Application:**
  - Node.js
  - MongoDB
  - TypeScript
  - Map APIs (e.g., Google Maps or OpenStreetMap)

- **Flutter App:**
  - Flutter SDK
  - Dart
  - Android Studio / Xcode (for iOS development)
  - Google Maps API key

### Installation

#### Web Application

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/your-username/sahara.git
    cd sahara
    ```

2. **Install Dependencies:**

    ```bash
    npm install
    ```

3. **Setup Environment Variables:**
   
   Create a `.env` file in the root directory and add your MongoDB connection string and API keys.

4. **Run the Application:**

    ```bash
    npm start
    ```

#### Flutter App

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/your-username/sahara.git
    cd sahara/flutter-app
    ```

2. **Install Dependencies:**

    ```bash
    flutter pub get
    ```

3. **Setup Configuration:**

   Update `lib/config.dart` with your Google Maps API key and any other necessary configuration.

4. **Run the Application:**

    ```bash
    flutter run
    ```

## Usage

### Web Application

- Navigate to the URL where the web app is hosted.
- Register as a volunteer or manage volunteer information from the admin panel.
- View real-time maps and disaster data.

### Mobile App

- Open the app and log in using OTP.
- Use the SOS button to send alerts for different types of emergencies.
- Allow location permissions to enable accurate SOS functionality.

## Contributing

We welcome contributions from the community! If you'd like to contribute to SAHARA, please follow these steps:

1. **Fork the Repository**
2. **Create a Feature Branch:**

    ```bash
    git checkout -b feature/your-feature
    ```

3. **Commit Your Changes:**

    ```bash
    git commit -am 'Add new feature'
    ```

4. **Push to the Branch:**

    ```bash
    git push origin feature/your-feature
    ```

5. **Open a Pull Request**

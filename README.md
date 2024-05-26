# Movie App

A Flutter project that showcases a movie application using various dependencies for state management, network requests, and dependency injection.

## Project Overview

This project is a movie application that displays movie information, handles network requests, and manages state efficiently using `flutter_bloc`. It utilizes `retrofit` for network calls, `get_it` and `injectable` for dependency injection, and `freezed` for immutable object management.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.4.0 <4.0.0)
- [Dart SDK](https://dart.dev/get-dart) (>=3.4.0 <4.0.0)

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/movie_app.git
   cd movie_app
   ```

2. Install the dependencies:

   ```sh
   flutter pub get
   ```

3. Run build runner:
   ```sh
   dart run build_runner build --delete-conflicting-outputs
   ```

### Running the App

Run the app on an emulator or connected device:

```sh
flutter run
```

# Tournament Tracker Software

A cross-platform tournament management application built with Flutter.

## Project Status

This project is in the initial setup phase. The basic structure has been established with:

- Database schema design with SQLite
- Basic data models (Tournament, Player, Match)
- Scaffold UI screens

## Next Steps

To complete this project, the following components need to be implemented:

1. **Detail Screens**:
   - Tournament Detail Screen
   - Player Detail Screen
   - Match Detail Screen

2. **Create/Edit Screens**:
   - Tournament Creation/Editing
   - Player Registration/Editing 
   - Match Recording

3. **Business Logic**:
   - Tournament Bracket Generation
   - Match Scheduling
   - Results Calculation

4. **Flutter Setup**:
   - Install Flutter SDK
   - Run `flutter create .` in the project root to initialize Flutter
   - Run `flutter pub get` to install dependencies

## Development Setup

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- Git

### Getting Started

1. Install Flutter by following the [official installation guide](https://flutter.dev/docs/get-started/install)

2. From the project root directory, run:
   ```bash
   flutter create .
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

## Features

- Tournament management (creation, editing, deletion)
- Player management (registration, statistics)
- Match tracking and results
- Offline-first with local SQLite database
- Modern, intuitive UI

## Project Structure

- `lib/` - Dart source code
  - `models/` - Data models
  - `screens/` - UI screens
  - `widgets/` - Reusable UI components
  - `services/` - Business logic and data services
  - `utils/` - Utility functions and helpers
- `assets/` - Static assets (images, fonts, etc.)
- `test/` - Test files

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 
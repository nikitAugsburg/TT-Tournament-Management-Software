# Tournament Tracker Software

A cross-platform tournament management application built with Flutter.

## Features

- Tournament management (creation, editing, deletion)
- Player management (registration, statistics)
- Match tracking and results
- Offline-first with local SQLite database
- Modern, intuitive UI

## Development Setup

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- Git

### Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/tt-software.git
   cd tt-software
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Run the application
   ```bash
   flutter run
   ```

## Project Structure

- `lib/` - Dart source code
  - `models/` - Data models
  - `screens/` - UI screens
  - `widgets/` - Reusable UI components
  - `services/` - Business logic and data services
  - `utils/` - Utility functions and helpers
- `assets/` - Static assets (images, fonts, etc.)
- `test/` - Test files

## Database Schema

The application uses SQLite for local storage with the following main tables:

- Tournaments
- Players
- Matches
- Settings

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 
# Simple API-Fetching Flutter Application

## Overview

This Flutter application fetches and displays a list of posts from a public API (https://jsonplaceholder.typicode.com/posts). It demonstrates how to handle asynchronous data fetching, display a loading indicator, and manage errors gracefully. The application features a clean and structured codebase, making it easy to understand and extend.

### Key Features
- Fetches data from a public API.
- Displays post titles in a scrollable ListView.
- Shows a CircularProgressIndicator while data is loading.
- Gracefully handles API errors with user-friendly error messages.

## File Structure

- **main.dart**: The main entry point of the Flutter application. It contains the logic for fetching data from the API and displaying it in a ListView.
- **pubspec.yaml**: Contains metadata about the project, including dependencies. Make sure to add the `http` package for API requests.

## Project Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/venu-galijarla/FlutterProject.git

   flutter pub get ( to download all the dependencies)
   flutter run (to run the application)
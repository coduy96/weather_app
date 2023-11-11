# Weather App Documentation

## Application UI and Unit Test Acceptance
| App UI | Test Results |
| --------- | ---------- |
| ![App Image](./assets/app_image.png) | ![Test Image](./assets/test_result.png) |


## Application features

The Weather App is designed to provide real-time weather updates with a simple and user-friendly interface. To use the app:

1. **Search Weather:** Search weather by seach bar
2. **Toggle Unit:** Switch between Celsius and Fahrenheit temperature units.

## Additional Features

1. Pull-to-refresh
2. Saving the current state even if the app is killed.

## App Structure

App structure, the cubit/ directory within the weather/ folder indicates that are using a simplified version of the BLoC pattern, known as Cubit. The main difference is that Cubit is a lighter and simpler way to manage state without the full complexity of streams that come with a full BLoC implementation.

App's BLoC components would handle all the logic for interacting with the open_meteo_api to fetch weather data, as well as managing the app state like loading, loaded, and error states. The weather_bloc_observer.dart likely contains code to observe BLoC state changes for debugging or logging purposes.

By adhering to the BLoC pattern, app is more maintainable and scalable, which is advantageous if you plan to add more features in the future or need to handle more complex state management scenarios.

## Run and build app

1. **Open a Terminal or Command Prompt**.

2. **Navigate to your project directory**:
   ```sh
   cd path/to/your/weather_app
   ```

3. **Get all the dependencies**:
   ```sh
   flutter pub get
   ```
   This command fetches all the necessary Flutter packages defined in your `pubspec.yaml` files.

4. **Run the build_runner**:
   ```sh
   flutter pub run build_runner build
   ```
   This step will generate code for your project using the build_runner package. This is commonly used for projects that use code generation for features like JSON serialization.

5. **Check that an emulator is running or a device is connected**:
   ```sh
   flutter devices
   ```
   This command lists all available devices or emulators.

6. **Run the app**:
   ```sh
   flutter run
   ```
   This command builds the app and installs it on the connected device or emulator. If you have multiple devices available, you might need to specify the device ID with the `-d` flag.

Optional steps if you encounter any issues:

- **Clean the build**:
  ```sh
  flutter clean
  ```
  Sometimes build-related problems can be resolved by cleaning the project.

- **Run the analyzer to check for any issues with your code**:
  ```sh
   flutter analyze
   ```
   This will give you a report of any linting errors or warnings in your code.

- **Run tests to ensure your app is working correctly**:
   ```sh
   flutter test
   ```
   This will run any unit or widget tests you've written in the `test/` directory.

> **Note:** Make sure to run `flutter pub run build_runner build` whenever you make changes to files that require code generation. If you want to watch for changes and automatically generate code, you can replace `build` with `watch` in the build_runner command.

## Contact

If you have any issues or questions, feel free to reach out to me at [coduy96@gmail.com](mailto:coduy96@gmail.com).
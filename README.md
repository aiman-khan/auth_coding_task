
# Login UI with Firebase Authentication using Cubit

## Overview

This project implements a login screen in Flutter, allowing users to sign in using their email and password with Firebase Authentication. The state management is handled using Cubit.

## Features

- **Login Screen**:
  - Email and password input fields with validation.
  - Login button with loading indicator during the authentication process.
  - Error message display for login failures.
  
- **State Management**:
  - Managed using Cubit, handling various states such as initial, loading, success, and error.
  
- **Firebase Authentication**:
  - Integrated Firebase Authentication for email/password sign-in.
  - Automatically creates a new user if the user does not exist during the login attempt.
  
- **Home Screen**:
  - Home screen after successful login.
  - Logout button that navigates back to the login screen.

## UI Design

The login screen is designed to match the provided Figma design. The design is responsive and adjusts to various screen sizes, ensuring a consistent user experience across devices.

## Project Structure

The project follows the separation of concerns by dividing the code into the following layers:

- **Presentation**: Contains the UI components and Cubit for state management.
- **Data**: Handles Firebase Authentication integration.
- **Domain**: Contains the business logic.


## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/aiman-khan/auth_coding_task.git
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run build_runner**:
   ```bash
   dart run build_runner watch --delete-conflicting-outputs
   ```

4. **Run the project**:
   ```bash
   flutter run
   ```

## Best Practices Followed

- **Separation of UI and Logic**: The project structure follows the separation of concerns, ensuring maintainability and scalability.
- **Responsive Design**: The UI is responsive, ensuring a consistent experience across different screen sizes.
- **Error Handling**: Proper validation and error handling are implemented to provide clear feedback to users.

## Figma Design

The design was created based on the [Figma design](https://www.figma.com/design/0xIxHweYnIAOiSO9gnJhuq/Flutter-Coding-Task?node-id=0-1&t=yhgDcLdS2ZFoHLyN-1) provided for this task.

## Screenshots

![image](https://github.com/user-attachments/assets/7e680714-26f9-4db1-b90d-59dacef4a583)


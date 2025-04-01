# MindMochi

MindMochi is a Flutter-based mobile application designed to help users effectively study for the MCAT. By integrating a custom-built API, the app provides dynamic study materials, personalized learning plans, and data-driven insights to enhance the user's study experience.

## Features

- **Interactive Study Tools** – Flashcards, quizzes, and spaced repetition techniques to reinforce key MCAT concepts.
- **Custom API Integration** – Retrieves up-to-date study materials, questions, and explanations from a centralized database.
- **Personalized Study Plans** – Adaptive learning recommendations based on user progress and performance.
- **User Progress Tracking** – Analyzes study patterns and offers insights to optimize retention and efficiency.
- **Cross-Platform Support** – Built with Flutter for compatibility across Android and iOS devices.

## Tech Stack

- **Frontend:** Flutter, Dart
- **Backend:** Custom-built RESTful API
- **Database:** Firebase / PostgreSQL (TBD)
- **Authentication:** Firebase Auth (or other secure authentication method)
- **Hosting:** TBD

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MindMochi.git
   cd MindMochi
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## API Integration

MindMochi uses a custom API to fetch MCAT study materials. The API endpoints include:

- **`GET /questions`** – Retrieve a list of MCAT questions.
- **`GET /flashcards`** – Access a curated set of flashcards.
- **`POST /progress`** – Save user progress data.
- **`GET /recommendations`** – Generate personalized study recommendations.

Ensure that the API is running and properly configured before using MindMochi.

## Roadmap

- [ ] Implement user authentication and profiles
- [ ] Expand question bank with additional MCAT topics
- [ ] Introduce AI-powered study recommendations
- [ ] Add dark mode and accessibility features

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new feature branch: `git checkout -b feature-name`
3. Commit changes and push: `git push origin feature-name`
4. Open a pull request.

## License

MindMochi is licensed under the MIT License.

## Contact

For questions or contributions, please reach out at daniel@danielgallegos.me or open an issue on GitHub.


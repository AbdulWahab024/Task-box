# 📋 Task Box

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

**A modern, feature-rich task management application built with Flutter and Firebase**
</div>

---

## 📖 About

Task Box is a powerful yet simple task management application designed to help users organize their daily tasks efficiently. Built with Flutter and Firebase, it offers real-time synchronization, secure authentication, and an intuitive user interface with dark mode support.

Whether you're managing personal tasks, work projects, or daily reminders, Task Box provides all the tools you need to stay productive and organized.

---

## ✨ Features

### 🔐 Authentication
- **User Registration**: Create a new account with email and password
- **Secure Login**: Access your tasks securely
- **Password Recovery**: Reset forgotten passwords via email

### 📝 Task Management
- **Create Tasks**: Add new tasks with titles and descriptions
- **View Tasks**: Browse all your tasks in an organized list
- **Update Tasks**: Edit task details anytime
- **Delete Tasks**: Remove completed or unwanted tasks
- **Real-time Sync**: All changes are instantly synced across devices via Firebase Realtime Database

### ✅ Task Organization
- **Mark as Complete**: Track your progress by marking tasks as done
- **Task Status**: Visual indicators for completed vs pending tasks
- **Search Functionality**: Quickly find tasks using keywords

### 👤 User Experience
- **User Profile**: View and manage your profile information
- **Dark Theme**: Eye-friendly dark mode for comfortable viewing
- **Clean UI**: Modern Material Design interface
- **Responsive Layout**: Works seamlessly on different screen sizes

---
## 🎥 Demo
<div align="center">
  
  ![App Demo](assets/videos/task_box video.gif)
  
</div>
---

## 📱 Usage

### Getting Started
1. **Register**: Create a new account with your email and password
2. **Login**: Sign in to access your task dashboard
3. **Create Tasks**: Tap the '+' button to add a new task
4. **Manage Tasks**: 
   - Tap on a task to view details
   - Swipe or use menu options to edit/delete
   - Check the checkbox to mark as complete
5. **Search**: Use the search bar to find specific tasks
6. **Profile**: Access your profile from the menu

### Firebase Realtime Database Structure
```json
{
  "users": {
    "userId": {
      "tasks": {
        "taskId": {
          "title": "Task Title",
          "description": "Task Description",
          "completed": false,
          "createdAt": "timestamp"
        }
      }
    }
  }
}
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|-----------|---------|
| **Flutter** | Cross-platform mobile framework |
| **Dart** | Programming language |
| **Firebase Authentication** | User authentication and management |
| **Firebase Realtime Database** | Cloud-hosted NoSQL database for real-time data sync |
| **Shared Preferences** | Local data persistence |
| **Material Design** | UI/UX design system |

### Key Dependencies
- `firebase_core`: Firebase SDK initialization
- `firebase_auth`: Authentication functionality
- `firebase_database`: Realtime Database integration
- `shared_preferences`: Local storage
- `provider` or `bloc`: State management (if applicable)

---

## 📂 Project Structure
```
Task-box/
├── android/                 # Android-specific files
├── assets/                  # Images, fonts, and other assets
├── lib/
│   ├── models/             # Data models
│   ├── screens/            # UI screens
│   │   ├── auth/          # Authentication screens
│   │   ├── home/          # Home/Dashboard screen
│   │   ├── profile/       # User profile screen
│   │   └── tasks/         # Task-related screens
│   ├── services/          # Firebase services
│   ├── widgets/           # Reusable widgets
│   └── main.dart          # App entry point
├── test/                   # Unit and widget tests
├── pubspec.yaml           # Dependencies and assets
└── README.md              # Project documentation
```

---

## 🔒 Security Features

- **Secure Authentication**: Firebase Authentication ensures secure user login
- **Password Reset**: Users can safely reset forgotten passwords
- **Data Privacy**: Each user's tasks are isolated and secured
- **Real-time Security Rules**: Firebase security rules prevent unauthorized access

---

## 🚧 Roadmap

- [ ] Add task categories and tags
- [ ] Implement task priority levels
- [ ] Add due dates and reminders
- [ ] Create collaborative task lists
- [ ] Add task attachments
- [ ] Implement offline mode
- [ ] Add data export functionality
- [ ] Create desktop version (Windows, macOS, Linux)

---

## 👨‍💻 Author

**Abdul Wahab**

- GitHub: [@AbdulWahab024](https://github.com/AbdulWahab024)
- LinkedIn: [www.linkedin.com/in/abdul-wahab-4a57b2285]
- Email: [abdulwahab2957@outlook.com]

---

## 🙏 Acknowledgments

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Material Design Guidelines](https://material.io/design)
- All contributors and supporters of this project

---

## ⭐ Show your support

Give a ⭐️ if this project helped you!

---

<div align="center">

**Made with ❤️ using Flutter**

</div>

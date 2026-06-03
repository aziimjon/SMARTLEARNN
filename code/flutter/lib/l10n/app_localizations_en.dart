// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navCourses => 'Courses';

  @override
  String get navSchedule => 'Schedule';

  @override
  String get navAiTutor => 'AI Tutor';

  @override
  String get navProfile => 'Profile';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get viewAll => 'All';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get edit => 'Edit';

  @override
  String get noData => 'No data';

  @override
  String get loading => 'Loading...';

  @override
  String get errorRetry => 'Retry';

  @override
  String get dashboardTitle => 'SmartLearn';

  @override
  String get onlineCourses => 'Online courses';

  @override
  String get todaySchedule => 'Today\'s schedule';

  @override
  String get noClassesToday => 'No classes today';

  @override
  String get statsOnlineCourses => 'Online';

  @override
  String get statsTodayClasses => 'Today';

  @override
  String get statsAttendance => 'Attendance';

  @override
  String get aiTeaserTitle => 'AI Tutor';

  @override
  String get aiTeaserSubtitle => 'Socratic method\nPersonalized learning';

  @override
  String get aiTeaserBadge => 'COMING SOON';

  @override
  String get aiTeaserAction => 'Learn more';

  @override
  String get coursesTitle => 'Courses';

  @override
  String get tabClassroom => 'Classroom';

  @override
  String get tabOnline => 'Online';

  @override
  String get searchCourses => 'Search courses...';

  @override
  String get noCourses => 'No courses found';

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelIntermediate => 'Intermediate';

  @override
  String get levelAdvanced => 'Advanced';

  @override
  String get statusActive => 'Active';

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusPublished => 'Published';

  @override
  String get statusArchived => 'Archived';

  @override
  String durationMinutes(int min) {
    return '$min min';
  }

  @override
  String get scheduleTitle => 'Schedule';

  @override
  String get noSchedule => 'No classes scheduled';

  @override
  String get statusDone => 'Done';

  @override
  String get statusPlanned => 'Planned';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get aiTutorTitle => 'AI Tutor';

  @override
  String get aiTutorTagline => 'Socratic method · Personalization';

  @override
  String get aiComingSoon => 'Coming soon';

  @override
  String get aiComingSoonDesc => 'AI Tutor is coming soon. Stay tuned!';

  @override
  String get aiFeaturesTitle => 'Features';

  @override
  String get aiPreviewTitle => 'Coming soon';

  @override
  String get featureSocrates => 'Socratic Method';

  @override
  String get featureSocratesDesc =>
      'AI asks guiding questions instead of direct answers — you arrive at the solution yourself';

  @override
  String get featurePersonalization => 'Personalization';

  @override
  String get featurePersonalizationDesc =>
      'Analyzes your performance and attendance, responds based on your level';

  @override
  String get featureDialog => 'Live Dialogue';

  @override
  String get featureDialogDesc =>
      'Ask questions on any course topic at any time';

  @override
  String get featureProgress => 'Progress Growth';

  @override
  String get featureProgressDesc =>
      'Tracks knowledge gaps and helps you close them precisely';

  @override
  String get chatInputHint => 'Ask a question... (coming soon)';

  @override
  String get mockQuestion => 'How does polymorphism work in Java?';

  @override
  String get mockAnswer =>
      'Great question! What do you think the word \"polymorphism\" means in Greek?';

  @override
  String get profileTitle => 'Profile';

  @override
  String get roleStudent => 'Student';

  @override
  String get roleTeacher => 'Teacher';

  @override
  String get roleAdmin => 'Administrator';

  @override
  String get roleSuperAdmin => 'Super Administrator';

  @override
  String get personalData => 'Personal information';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get fieldGender => 'Gender';

  @override
  String get fieldFirstName => 'First name';

  @override
  String get fieldLastName => 'Last name';

  @override
  String get fieldMiddleName => 'Middle name';

  @override
  String get fieldBirthDate => 'Date of birth';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsLanguage => 'Interface language';

  @override
  String get settingsPassword => 'Change password';

  @override
  String get logout => 'Sign out';

  @override
  String get editProfile => 'Edit profile';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get profileUpdated => 'Profile updated';

  @override
  String get profileUpdateError => 'Failed to update profile';

  @override
  String get requiredField => 'Required field';

  @override
  String get languageTitle => 'Interface language';

  @override
  String get langEnglish => 'English';

  @override
  String get langRussian => 'Русский';

  @override
  String get langUzbek => 'O\'zbek';

  @override
  String get loginTitle => 'Sign in to SmartLearn';

  @override
  String get loginSubtitle => 'Enter your credentials';

  @override
  String get fieldLogin => 'Login';

  @override
  String get fieldPassword => 'Password';

  @override
  String get loginButton => 'Sign in';

  @override
  String get loginRequired => 'Enter login';

  @override
  String get passwordRequired => 'Enter password';

  @override
  String get todayClasses => 'Today\'s classes';

  @override
  String get statusPresent => 'Present';

  @override
  String get statusLate => 'Late';

  @override
  String get statusAbsent => 'Absent';

  @override
  String get statusExcused => 'Excused';

  @override
  String get todayNoClassesFull =>
      'No classes today\nGreat day for self-study!';

  @override
  String get onlineCoursesEmpty => 'No online courses yet';

  @override
  String get scheduleLoadError => 'Failed to load schedule';

  @override
  String get aiTeaserPersonalTutor => 'Personal tutor\nusing Socratic method';

  @override
  String get aiBetaBadge => 'BETA';

  @override
  String get aiWelcomeTitle => 'Hi! I\'m your AI Tutor.';

  @override
  String get aiWelcomeDesc =>
      'I don\'t give ready-made answers. Instead, I ask guiding questions so you arrive at the solution yourself — the Socratic method.';

  @override
  String get aiTrySuggestions => 'Try asking:';

  @override
  String get aiSuggestion1 => 'How does polymorphism work in OOP?';

  @override
  String get aiSuggestion2 =>
      'Explain the difference between a stack and a queue';

  @override
  String get aiSuggestion3 => 'What is SQL injection and how to prevent it?';

  @override
  String get aiInputHint => 'Ask a question about the course...';

  @override
  String get aiThinkingHint => 'AI is thinking...';
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n? of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n);
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get navCourses;

  /// No description provided for @navSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get navSchedule;

  /// No description provided for @navAiTutor.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor'**
  String get navAiTutor;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get viewAll;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @errorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get errorRetry;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'SmartLearn'**
  String get dashboardTitle;

  /// No description provided for @onlineCourses.
  ///
  /// In en, this message translates to:
  /// **'Online courses'**
  String get onlineCourses;

  /// No description provided for @todaySchedule.
  ///
  /// In en, this message translates to:
  /// **'Today\'s schedule'**
  String get todaySchedule;

  /// No description provided for @noClassesToday.
  ///
  /// In en, this message translates to:
  /// **'No classes today'**
  String get noClassesToday;

  /// No description provided for @statsOnlineCourses.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statsOnlineCourses;

  /// No description provided for @statsTodayClasses.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get statsTodayClasses;

  /// No description provided for @statsAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get statsAttendance;

  /// No description provided for @aiTeaserTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor'**
  String get aiTeaserTitle;

  /// No description provided for @aiTeaserSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Socratic method\nPersonalized learning'**
  String get aiTeaserSubtitle;

  /// No description provided for @aiTeaserBadge.
  ///
  /// In en, this message translates to:
  /// **'COMING SOON'**
  String get aiTeaserBadge;

  /// No description provided for @aiTeaserAction.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get aiTeaserAction;

  /// No description provided for @coursesTitle.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get coursesTitle;

  /// No description provided for @tabClassroom.
  ///
  /// In en, this message translates to:
  /// **'Classroom'**
  String get tabClassroom;

  /// No description provided for @tabOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get tabOnline;

  /// No description provided for @searchCourses.
  ///
  /// In en, this message translates to:
  /// **'Search courses...'**
  String get searchCourses;

  /// No description provided for @noCourses.
  ///
  /// In en, this message translates to:
  /// **'No courses found'**
  String get noCourses;

  /// No description provided for @levelBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get levelBeginner;

  /// No description provided for @levelIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get levelIntermediate;

  /// No description provided for @levelAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get levelAdvanced;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// No description provided for @statusPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get statusPublished;

  /// No description provided for @statusArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get statusArchived;

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{min} min'**
  String durationMinutes(int min);

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get scheduleTitle;

  /// No description provided for @noSchedule.
  ///
  /// In en, this message translates to:
  /// **'No classes scheduled'**
  String get noSchedule;

  /// No description provided for @statusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get statusDone;

  /// No description provided for @statusPlanned.
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get statusPlanned;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @aiTutorTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor'**
  String get aiTutorTitle;

  /// No description provided for @aiTutorTagline.
  ///
  /// In en, this message translates to:
  /// **'Socratic method · Personalization'**
  String get aiTutorTagline;

  /// No description provided for @aiComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get aiComingSoon;

  /// No description provided for @aiComingSoonDesc.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor is coming soon. Stay tuned!'**
  String get aiComingSoonDesc;

  /// No description provided for @aiFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get aiFeaturesTitle;

  /// No description provided for @aiPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get aiPreviewTitle;

  /// No description provided for @featureSocrates.
  ///
  /// In en, this message translates to:
  /// **'Socratic Method'**
  String get featureSocrates;

  /// No description provided for @featureSocratesDesc.
  ///
  /// In en, this message translates to:
  /// **'AI asks guiding questions instead of direct answers — you arrive at the solution yourself'**
  String get featureSocratesDesc;

  /// No description provided for @featurePersonalization.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get featurePersonalization;

  /// No description provided for @featurePersonalizationDesc.
  ///
  /// In en, this message translates to:
  /// **'Analyzes your performance and attendance, responds based on your level'**
  String get featurePersonalizationDesc;

  /// No description provided for @featureDialog.
  ///
  /// In en, this message translates to:
  /// **'Live Dialogue'**
  String get featureDialog;

  /// No description provided for @featureDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'Ask questions on any course topic at any time'**
  String get featureDialogDesc;

  /// No description provided for @featureProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress Growth'**
  String get featureProgress;

  /// No description provided for @featureProgressDesc.
  ///
  /// In en, this message translates to:
  /// **'Tracks knowledge gaps and helps you close them precisely'**
  String get featureProgressDesc;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask a question... (coming soon)'**
  String get chatInputHint;

  /// No description provided for @mockQuestion.
  ///
  /// In en, this message translates to:
  /// **'How does polymorphism work in Java?'**
  String get mockQuestion;

  /// No description provided for @mockAnswer.
  ///
  /// In en, this message translates to:
  /// **'Great question! What do you think the word \"polymorphism\" means in Greek?'**
  String get mockAnswer;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @roleStudent.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get roleStudent;

  /// No description provided for @roleTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get roleTeacher;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get roleAdmin;

  /// No description provided for @roleSuperAdmin.
  ///
  /// In en, this message translates to:
  /// **'Super Administrator'**
  String get roleSuperAdmin;

  /// No description provided for @personalData.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalData;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get fieldName;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get fieldPhone;

  /// No description provided for @fieldGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get fieldGender;

  /// No description provided for @fieldFirstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get fieldFirstName;

  /// No description provided for @fieldLastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get fieldLastName;

  /// No description provided for @fieldMiddleName.
  ///
  /// In en, this message translates to:
  /// **'Middle name'**
  String get fieldMiddleName;

  /// No description provided for @fieldBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get fieldBirthDate;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get settingsLanguage;

  /// No description provided for @settingsPassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get settingsPassword;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get logout;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile'**
  String get profileUpdateError;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get languageTitle;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get langRussian;

  /// No description provided for @langUzbek.
  ///
  /// In en, this message translates to:
  /// **'O\'zbek'**
  String get langUzbek;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to SmartLearn'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials'**
  String get loginSubtitle;

  /// No description provided for @fieldLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get fieldLogin;

  /// No description provided for @fieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get fieldPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginButton;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter login'**
  String get loginRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get passwordRequired;

  /// No description provided for @todayClasses.
  ///
  /// In en, this message translates to:
  /// **'Today\'s classes'**
  String get todayClasses;

  /// No description provided for @statusPresent.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get statusPresent;

  /// No description provided for @statusLate.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get statusLate;

  /// No description provided for @statusAbsent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get statusAbsent;

  /// No description provided for @statusExcused.
  ///
  /// In en, this message translates to:
  /// **'Excused'**
  String get statusExcused;

  /// No description provided for @todayNoClassesFull.
  ///
  /// In en, this message translates to:
  /// **'No classes today\nGreat day for self-study!'**
  String get todayNoClassesFull;

  /// No description provided for @onlineCoursesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No online courses yet'**
  String get onlineCoursesEmpty;

  /// No description provided for @scheduleLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load schedule'**
  String get scheduleLoadError;

  /// No description provided for @aiTeaserPersonalTutor.
  ///
  /// In en, this message translates to:
  /// **'Personal tutor\nusing Socratic method'**
  String get aiTeaserPersonalTutor;

  /// No description provided for @aiBetaBadge.
  ///
  /// In en, this message translates to:
  /// **'BETA'**
  String get aiBetaBadge;

  /// No description provided for @aiWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi! I\'m your AI Tutor.'**
  String get aiWelcomeTitle;

  /// No description provided for @aiWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'I don\'t give ready-made answers. Instead, I ask guiding questions so you arrive at the solution yourself — the Socratic method.'**
  String get aiWelcomeDesc;

  /// No description provided for @aiTrySuggestions.
  ///
  /// In en, this message translates to:
  /// **'Try asking:'**
  String get aiTrySuggestions;

  /// No description provided for @aiSuggestion1.
  ///
  /// In en, this message translates to:
  /// **'How does polymorphism work in OOP?'**
  String get aiSuggestion1;

  /// No description provided for @aiSuggestion2.
  ///
  /// In en, this message translates to:
  /// **'Explain the difference between a stack and a queue'**
  String get aiSuggestion2;

  /// No description provided for @aiSuggestion3.
  ///
  /// In en, this message translates to:
  /// **'What is SQL injection and how to prevent it?'**
  String get aiSuggestion3;

  /// No description provided for @aiInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask a question about the course...'**
  String get aiInputHint;

  /// No description provided for @aiThinkingHint.
  ///
  /// In en, this message translates to:
  /// **'AI is thinking...'**
  String get aiThinkingHint;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppL10nEn();
    case 'ru':
      return AppL10nRu();
    case 'uz':
      return AppL10nUz();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

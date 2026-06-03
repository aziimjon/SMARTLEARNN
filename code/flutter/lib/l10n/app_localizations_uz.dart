// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppL10nUz extends AppL10n {
  AppL10nUz([String locale = 'uz']) : super(locale);

  @override
  String get navHome => 'Bosh sahifa';

  @override
  String get navCourses => 'Kurslar';

  @override
  String get navSchedule => 'Jadval';

  @override
  String get navAiTutor => 'AI-Muallim';

  @override
  String get navProfile => 'Profil';

  @override
  String get greetingMorning => 'Xayrli tong';

  @override
  String get greetingAfternoon => 'Xayrli kun';

  @override
  String get greetingEvening => 'Xayrli kech';

  @override
  String get viewAll => 'Barchasi';

  @override
  String get save => 'Saqlash';

  @override
  String get cancel => 'Bekor qilish';

  @override
  String get edit => 'Tahrirlash';

  @override
  String get noData => 'Ma\'lumot yo\'q';

  @override
  String get loading => 'Yuklanmoqda...';

  @override
  String get errorRetry => 'Qayta urinish';

  @override
  String get dashboardTitle => 'SmartLearn';

  @override
  String get onlineCourses => 'Online kurslar';

  @override
  String get todaySchedule => 'Bugungi jadval';

  @override
  String get noClassesToday => 'Bugun dars yo\'q';

  @override
  String get statsOnlineCourses => 'Online';

  @override
  String get statsTodayClasses => 'Bugun';

  @override
  String get statsAttendance => 'Davomat';

  @override
  String get aiTeaserTitle => 'AI-Muallim';

  @override
  String get aiTeaserSubtitle => 'Sokrat metodi\nShaxsiylashtirish';

  @override
  String get aiTeaserBadge => 'TEZDA';

  @override
  String get aiTeaserAction => 'Batafsil';

  @override
  String get coursesTitle => 'Kurslar';

  @override
  String get tabClassroom => 'Sinfxona';

  @override
  String get tabOnline => 'Online';

  @override
  String get searchCourses => 'Kurslarni qidirish...';

  @override
  String get noCourses => 'Kurslar topilmadi';

  @override
  String get levelBeginner => 'Boshlang\'ich';

  @override
  String get levelIntermediate => 'O\'rta';

  @override
  String get levelAdvanced => 'Yuqori';

  @override
  String get statusActive => 'Faol';

  @override
  String get statusDraft => 'Qoralama';

  @override
  String get statusPublished => 'Chop etilgan';

  @override
  String get statusArchived => 'Arxivlangan';

  @override
  String durationMinutes(int min) {
    return '$min daqiqa';
  }

  @override
  String get scheduleTitle => 'Jadval';

  @override
  String get noSchedule => 'Jadval yo\'q';

  @override
  String get statusDone => 'Bajarildi';

  @override
  String get statusPlanned => 'Rejalashtirilgan';

  @override
  String get statusCancelled => 'Bekor qilindi';

  @override
  String get aiTutorTitle => 'AI-Muallim';

  @override
  String get aiTutorTagline => 'Sokrat metodi · Shaxsiylashtirish';

  @override
  String get aiComingSoon => 'Ishlab chiqilmoqda';

  @override
  String get aiComingSoonDesc =>
      'AI-Muallim tez orada paydo bo\'ladi. Yangilanishlarni kuzating!';

  @override
  String get aiFeaturesTitle => 'Imkoniyatlar';

  @override
  String get aiPreviewTitle => 'Tez orada';

  @override
  String get featureSocrates => 'Sokrat Metodi';

  @override
  String get featureSocratesDesc =>
      'AI tayyor javob berish o\'rniga yo\'naltiruvchi savollar beradi — siz o\'zingiz yechimga kelasiz';

  @override
  String get featurePersonalization => 'Shaxsiylashtirish';

  @override
  String get featurePersonalizationDesc =>
      'Sizning ko\'rsatkichlaringiz va davomatini tahlil qiladi, darajangizga qarab javob beradi';

  @override
  String get featureDialog => 'Jonli dialog';

  @override
  String get featureDialogDesc => 'Istalgan vaqtda kurs mavzusida savol bering';

  @override
  String get featureProgress => 'Taraqqiyot';

  @override
  String get featureProgressDesc =>
      'Bilim bo\'shliqlarini kuzatadi va ularni to\'ldirishga yordam beradi';

  @override
  String get chatInputHint => 'Savol bering... (tez orada)';

  @override
  String get mockQuestion => 'Java-da polimorfizm qanday ishlaydi?';

  @override
  String get mockAnswer =>
      'Ajoyib savol! Sizningcha, «polimorfizm» so\'zi yunonchada nimani anglatadi?';

  @override
  String get profileTitle => 'Profil';

  @override
  String get roleStudent => 'Talaba';

  @override
  String get roleTeacher => 'O\'qituvchi';

  @override
  String get roleAdmin => 'Administrator';

  @override
  String get roleSuperAdmin => 'Super Administrator';

  @override
  String get personalData => 'Shaxsiy ma\'lumotlar';

  @override
  String get fieldName => 'Ism';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldGender => 'Jinsi';

  @override
  String get fieldFirstName => 'Ism';

  @override
  String get fieldLastName => 'Familiya';

  @override
  String get fieldMiddleName => 'Otasining ismi';

  @override
  String get fieldBirthDate => 'Tug\'ilgan sana';

  @override
  String get genderMale => 'Erkak';

  @override
  String get genderFemale => 'Ayol';

  @override
  String get settingsTitle => 'Sozlamalar';

  @override
  String get settingsNotifications => 'Bildirishnomalar';

  @override
  String get settingsLanguage => 'Interfeys tili';

  @override
  String get settingsPassword => 'Parolni o\'zgartirish';

  @override
  String get logout => 'Chiqish';

  @override
  String get editProfile => 'Profilni tahrirlash';

  @override
  String get saveChanges => 'O\'zgarishlarni saqlash';

  @override
  String get profileUpdated => 'Profil yangilandi';

  @override
  String get profileUpdateError => 'Profilni yangilashda xato';

  @override
  String get requiredField => 'Majburiy maydon';

  @override
  String get languageTitle => 'Interfeys tili';

  @override
  String get langEnglish => 'English';

  @override
  String get langRussian => 'Русский';

  @override
  String get langUzbek => 'O\'zbek';

  @override
  String get loginTitle => 'SmartLearn\'ga kirish';

  @override
  String get loginSubtitle => 'Ma\'lumotlaringizni kiriting';

  @override
  String get fieldLogin => 'Login';

  @override
  String get fieldPassword => 'Parol';

  @override
  String get loginButton => 'Kirish';

  @override
  String get loginRequired => 'Loginni kiriting';

  @override
  String get passwordRequired => 'Parolni kiriting';

  @override
  String get todayClasses => 'Bugungi darslar';

  @override
  String get statusPresent => 'Keldi';

  @override
  String get statusLate => 'Kechikdi';

  @override
  String get statusAbsent => 'Kelmadi';

  @override
  String get statusExcused => 'Uzrli sabab';

  @override
  String get todayNoClassesFull =>
      'Bugun dars yo\'q\nMustaqil o\'rganish uchun ajoyib kun!';

  @override
  String get onlineCoursesEmpty => 'Hali online kurslar yo\'q';

  @override
  String get scheduleLoadError => 'Jadval yuklanmadi';

  @override
  String get aiTeaserPersonalTutor =>
      'Sokrat metodi asosida\nshaxsiy repetitor';

  @override
  String get aiBetaBadge => 'BETA';

  @override
  String get aiWelcomeTitle => 'Salom! Men sizning AI-Muallimingizman.';

  @override
  String get aiWelcomeDesc =>
      'Men tayyor javob bermayman. Buning o\'rniga yo\'naltiruvchi savollar beraman, shunda siz o\'zingiz yechimga kelasiz — Sokrat metodi.';

  @override
  String get aiTrySuggestions => 'Savol berib ko\'ring:';

  @override
  String get aiSuggestion1 => 'OOP\'da polimorfizm qanday ishlaydi?';

  @override
  String get aiSuggestion2 => 'Stek va navbat orasidagi farqni tushuntir';

  @override
  String get aiSuggestion3 =>
      'SQL-inyeksiya nima va undan qanday himoyalanish mumkin?';

  @override
  String get aiInputHint => 'Kurs mavzusida savol bering...';

  @override
  String get aiThinkingHint => 'AI o\'ylamoqda...';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppL10nRu extends AppL10n {
  AppL10nRu([String locale = 'ru']) : super(locale);

  @override
  String get navHome => 'Главная';

  @override
  String get navCourses => 'Курсы';

  @override
  String get navSchedule => 'Расписание';

  @override
  String get navAiTutor => 'ИИ-тьютор';

  @override
  String get navProfile => 'Профиль';

  @override
  String get greetingMorning => 'Доброе утро';

  @override
  String get greetingAfternoon => 'Добрый день';

  @override
  String get greetingEvening => 'Добрый вечер';

  @override
  String get viewAll => 'Все';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get edit => 'Редактировать';

  @override
  String get noData => 'Нет данных';

  @override
  String get loading => 'Загрузка...';

  @override
  String get errorRetry => 'Повторить';

  @override
  String get dashboardTitle => 'SmartLearn';

  @override
  String get onlineCourses => 'Онлайн-курсы';

  @override
  String get todaySchedule => 'Сегодня в расписании';

  @override
  String get noClassesToday => 'Занятий нет';

  @override
  String get statsOnlineCourses => 'Онлайн';

  @override
  String get statsTodayClasses => 'Сегодня';

  @override
  String get statsAttendance => 'Посещ.';

  @override
  String get aiTeaserTitle => 'ИИ-тьютор';

  @override
  String get aiTeaserSubtitle => 'Метод Сократа\nПерсонализация';

  @override
  String get aiTeaserBadge => 'СКОРО';

  @override
  String get aiTeaserAction => 'Подробнее';

  @override
  String get coursesTitle => 'Курсы';

  @override
  String get tabClassroom => 'Классные';

  @override
  String get tabOnline => 'Онлайн';

  @override
  String get searchCourses => 'Поиск курсов...';

  @override
  String get noCourses => 'Курсы не найдены';

  @override
  String get levelBeginner => 'Начинающий';

  @override
  String get levelIntermediate => 'Средний';

  @override
  String get levelAdvanced => 'Продвинутый';

  @override
  String get statusActive => 'Активный';

  @override
  String get statusDraft => 'Черновик';

  @override
  String get statusPublished => 'Опубликован';

  @override
  String get statusArchived => 'В архиве';

  @override
  String durationMinutes(int min) {
    return '$min мин';
  }

  @override
  String get scheduleTitle => 'Расписание';

  @override
  String get noSchedule => 'Занятий нет';

  @override
  String get statusDone => 'Завершено';

  @override
  String get statusPlanned => 'Запланировано';

  @override
  String get statusCancelled => 'Отменено';

  @override
  String get aiTutorTitle => 'ИИ-тьютор';

  @override
  String get aiTutorTagline => 'Метод Сократа · Персонализация';

  @override
  String get aiComingSoon => 'В разработке';

  @override
  String get aiComingSoonDesc =>
      'ИИ-тьютор скоро появится. Следите за обновлениями!';

  @override
  String get aiFeaturesTitle => 'Возможности';

  @override
  String get aiPreviewTitle => 'Скоро здесь будет';

  @override
  String get featureSocrates => 'Метод Сократа';

  @override
  String get featureSocratesDesc =>
      'ИИ задаёт наводящие вопросы вместо готовых ответов — вы приходите к решению самостоятельно';

  @override
  String get featurePersonalization => 'Персонализация';

  @override
  String get featurePersonalizationDesc =>
      'Анализирует вашу успеваемость и посещаемость, отвечает с учётом вашего уровня';

  @override
  String get featureDialog => 'Живой диалог';

  @override
  String get featureDialogDesc =>
      'Задавайте вопросы по любой теме курса в любое время';

  @override
  String get featureProgress => 'Рост прогресса';

  @override
  String get featureProgressDesc =>
      'Отслеживает пробелы в знаниях и помогает закрыть их точечно';

  @override
  String get chatInputHint => 'Задайте вопрос... (скоро)';

  @override
  String get mockQuestion => 'Как работает полиморфизм в Java?';

  @override
  String get mockAnswer =>
      'Интересный вопрос! А что, по-вашему, означает слово «полиморфизм» в переводе с греческого?';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get roleStudent => 'Студент';

  @override
  String get roleTeacher => 'Учитель';

  @override
  String get roleAdmin => 'Администратор';

  @override
  String get roleSuperAdmin => 'Суперадминистратор';

  @override
  String get personalData => 'Личные данные';

  @override
  String get fieldName => 'Имя';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldGender => 'Пол';

  @override
  String get fieldFirstName => 'Имя';

  @override
  String get fieldLastName => 'Фамилия';

  @override
  String get fieldMiddleName => 'Отчество';

  @override
  String get fieldBirthDate => 'Дата рождения';

  @override
  String get genderMale => 'Мужской';

  @override
  String get genderFemale => 'Женский';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsNotifications => 'Уведомления';

  @override
  String get settingsLanguage => 'Язык интерфейса';

  @override
  String get settingsPassword => 'Изменить пароль';

  @override
  String get logout => 'Выйти из аккаунта';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get profileUpdated => 'Профиль обновлён';

  @override
  String get profileUpdateError => 'Не удалось обновить профиль';

  @override
  String get requiredField => 'Обязательное поле';

  @override
  String get languageTitle => 'Язык интерфейса';

  @override
  String get langEnglish => 'English';

  @override
  String get langRussian => 'Русский';

  @override
  String get langUzbek => 'O\'zbek';

  @override
  String get loginTitle => 'Вход в SmartLearn';

  @override
  String get loginSubtitle => 'Введите ваши данные';

  @override
  String get fieldLogin => 'Логин';

  @override
  String get fieldPassword => 'Пароль';

  @override
  String get loginButton => 'Войти';

  @override
  String get loginRequired => 'Введите логин';

  @override
  String get passwordRequired => 'Введите пароль';

  @override
  String get todayClasses => 'Сегодняшние занятия';

  @override
  String get statusPresent => 'Присутствовал';

  @override
  String get statusLate => 'Опоздал';

  @override
  String get statusAbsent => 'Пропустил';

  @override
  String get statusExcused => 'Уважительная';

  @override
  String get todayNoClassesFull =>
      'Занятий сегодня нет\nОтличный день для самостоятельного обучения!';

  @override
  String get onlineCoursesEmpty => 'Онлайн-курсов пока нет';

  @override
  String get scheduleLoadError => 'Не удалось загрузить расписание';

  @override
  String get aiTeaserPersonalTutor =>
      'Персональный репетитор\nпо методу Сократа';

  @override
  String get aiBetaBadge => 'BETA';

  @override
  String get aiWelcomeTitle => 'Привет! Я ваш ИИ-тьютор.';

  @override
  String get aiWelcomeDesc =>
      'Я не даю готовых ответов. Вместо этого задаю наводящие вопросы, чтобы вы сами пришли к решению — метод Сократа.';

  @override
  String get aiTrySuggestions => 'Попробуйте спросить:';

  @override
  String get aiSuggestion1 => 'Как работает полиморфизм в ООП?';

  @override
  String get aiSuggestion2 => 'Объясни разницу между стеком и очередью';

  @override
  String get aiSuggestion3 => 'Что такое SQL-инъекция и как её избежать?';

  @override
  String get aiInputHint => 'Задайте вопрос по теме курса...';

  @override
  String get aiThinkingHint => 'ИИ думает...';
}

import 'dart:math';

import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/ai_coach_repository.dart';
import '../models/ai_message.dart';

// ignore: unused_field
class AiCoachRepositoryImpl implements AiCoachRepository {
  // ignore: unused_field
  final DioClient _dioClient;
  AiCoachRepositoryImpl(this._dioClient);

  static final _rng = Random();

  @override
  Future<Either<Failure, String>> sendMessage({
    required String message,
    required List<AiMessage> history,
    String locale = 'ru',
  }) async {
    await Future.delayed(Duration(milliseconds: 900 + _rng.nextInt(800)));
    final q = message.toLowerCase();
    final turn = history.length;
    return Right(switch (locale) {
      'en' => _respondEn(q, turn),
      'uz' => _respondUz(q, turn),
      _ => _respondRu(q, turn),
    });
  }

  // ── RUSSIAN ───────────────────────────────────────────────────────────────

  static String _respondRu(String q, int turn) {
    if (_has(q, ['привет', 'здравствуй', 'hello', 'добрый'])) {
      return 'Привет! Рад вас видеть. Я ваш ИИ-тьютор, работающий по методу Сократа — '
          'не даю готовых ответов, а задаю вопросы, которые приводят вас к решению самостоятельно.\n\n'
          'О чём поговорим сегодня? ООП, алгоритмы, базы данных, Flutter, безопасность?';
    }
    if (_has(q, ['полиморфизм', 'polymorphism'])) {
      return _pick([
        'Хороший вопрос! Что происходит, когда один и тот же метод вызывается у разных объектов? '
            'Почему результат может быть разным?',
        'Представьте класс «Животное» с методом звук(). Что вернёт он у собаки и у кошки? '
            'Как это связано с полиморфизмом?',
      ]);
    }
    if (_has(q, ['наследование', 'inheritance'])) {
      return _pick([
        'Зачем вообще нужно наследование? Что было бы, если бы его не существовало?',
        'У вас есть классы «Студент» и «Преподаватель». Какие поля у них общие? '
            'Стоит ли выделить родительский класс и почему?',
      ]);
    }
    if (_has(q, ['инкапсуляция', 'encapsulation'])) {
      return 'Почему мы не делаем все поля класса публичными? Что плохого случится, '
          'если любой код сможет изменить любое поле напрямую?';
    }
    if (_has(q, ['абстракци', 'interface', 'интерфейс'])) {
      return 'Чем абстрактный класс отличается от интерфейса? '
          'Попробуйте назвать хотя бы одно отличие — и мы пойдём глубже.';
    }
    if (_has(q, ['стек', 'stack'])) {
      return _pick([
        'Какой элемент вы заберёте первым — тот, что положили раньше всего, '
            'или последним? Почему это называют LIFO?',
        'Браузер хранит историю посещений. Когда вы нажимаете «Назад» — '
            'какая структура данных здесь используется и почему?',
      ]);
    }
    if (_has(q, ['очередь', 'queue'])) {
      return 'Представьте очередь в кассу магазина. Кто обслуживается первым? '
          'Как это правило называется в программировании — FIFO или LIFO?';
    }
    if (_has(q, ['дерево', 'tree', 'бинарн'])) {
      return 'Чем дерево отличается от связного списка? '
          'Какое главное свойство узла в дереве, которого нет в списке?';
    }
    if (_has(q, ['хеш', 'hash', 'словарь'])) {
      return 'Почему поиск в хеш-таблице работает за O(1), а не за O(n) как в списке? '
          'Что делает хеш-функция?';
    }
    if (_has(q, ['сортировк', 'sort', 'пузырьк', 'быстрая'])) {
      return _pick([
        'Какая сортировка самая простая, но самая медленная на больших данных? '
            'Почему сортировка пузырьком имеет сложность O(n²)?',
        'У вас массив из миллиона элементов. Bubble sort или Quick sort? '
            'Объясните своими словами, почему одна быстрее другой.',
      ]);
    }
    if (_has(q, ['сложност', 'big o', 'o(n)', 'асимптотик'])) {
      return 'Если цикл проходит по массиву — это O(n). '
          'А если внутри цикла есть ещё один цикл по тому же массиву — какая сложность? Почему?';
    }
    if (_has(q, ['рекурси'])) {
      return 'Что будет, если рекурсивная функция не имеет базового случая? '
          'Что произойдёт со стеком вызовов?';
    }
    if (_has(q, ['sql-инъекци', 'sql inject', 'инъекци'])) {
      return 'Представьте форму входа. Пользователь вводит логин: `admin\'--`. '
          'Что происходит с SQL-запросом? Почему это опасно?';
    }
    if (_has(q, ['rest', 'api', 'endpoint'])) {
      return _pick([
        'Какие HTTP-методы вы знаете? Чем GET отличается от POST не только синтаксически, но и семантически?',
        'Что означает «stateless» в REST? Почему сервер не хранит состояние сессии?',
      ]);
    }
    if (_has(q, ['jwt', 'токен', 'авториза'])) {
      return 'Из каких трёх частей состоит JWT-токен? '
          'Что хранится в payload и почему туда нельзя класть конфиденциальные данные?';
    }
    if (_has(q, ['flutter', 'dart', 'widget', 'виджет'])) {
      return _pick([
        'Чем StatefulWidget отличается от StatelessWidget? '
            'Когда нужно использовать каждый — приведите пример.',
        'Что такое Widget Tree, Element Tree и RenderObject Tree? Зачем их три?',
      ]);
    }
    if (_has(q, ['git', 'ветк', 'branch', 'merge', 'rebase'])) {
      return 'Чем git merge отличается от git rebase? '
          'Что происходит с историей коммитов в каждом случае?';
    }
    if (_has(q, ['solid', 'dry', 'принцип', 'clean code'])) {
      return 'Начнём с S — Single Responsibility. '
          'Что значит «у класса должна быть только одна причина для изменения»? '
          'Приведите пример нарушения.';
    }
    if (_has(q, ['спасибо', 'понял', 'понятно', 'ясно'])) {
      return _pick([
        'Отлично! Попробуйте объяснить это своими словами, как другу. '
            'Это лучший способ проверить понимание.',
        'Хорошо! Придумайте один реальный пример из жизни, где эта концепция применяется.',
      ]);
    }
    if (turn == 0) {
      return 'Интересный вопрос! Что вы уже знаете по этой теме? '
          'Даже если немного — это поможет мне понять, с какой точки начать.';
    }
    return _pick([
      'Попробуйте описать проблему своими словами, как будто объясняете человеку без технического образования.',
      'Что произойдёт, если сделать наоборот? Иногда понять концепцию легче от противного.',
      'Мы продвигаемся хорошо. Попробуйте сформулировать главный вывод одним предложением.',
    ]);
  }

  // ── ENGLISH ───────────────────────────────────────────────────────────────

  static String _respondEn(String q, int turn) {
    if (_has(q, ['hi', 'hello', 'hey', 'good morning', 'good afternoon'])) {
      return 'Hello! I\'m your AI Tutor using the Socratic method — '
          'I don\'t give ready answers, I ask guiding questions so you arrive at solutions yourself.\n\n'
          'What would you like to explore? OOP, algorithms, databases, Flutter, security?';
    }
    if (_has(q, ['polymorphism'])) {
      return _pick([
        'Great question! What happens when the same method is called on different objects? '
            'Why might the result differ?',
        'Imagine an Animal class with a sound() method. What would a Dog return vs a Cat? '
            'How does that relate to polymorphism?',
      ]);
    }
    if (_has(q, ['inheritance', 'extends'])) {
      return 'Why does inheritance exist at all? What would happen if it didn\'t? '
          'Think about how you\'d write your code without it.';
    }
    if (_has(q, ['encapsulation', 'private', 'getter', 'setter'])) {
      return 'Why don\'t we just make all class fields public? '
          'What could go wrong if any code could directly change any field?';
    }
    if (_has(q, ['abstract', 'interface'])) {
      return 'What\'s the difference between an abstract class and an interface? '
          'Try to name at least one difference — then we\'ll go deeper.';
    }
    if (_has(q, ['stack'])) {
      return _pick([
        'In a stack, which element do you get first — the one you put in earliest, or most recently? '
            'Why is it called LIFO?',
        'A browser stores history. When you click "Back" — which data structure is used and why?',
      ]);
    }
    if (_has(q, ['queue'])) {
      return 'Think of a checkout line at a store. Who gets served first? '
          'What is this principle called in programming — FIFO or LIFO?';
    }
    if (_has(q, ['tree', 'binary'])) {
      return 'How does a tree differ from a linked list? '
          'What key property does a tree node have that a list node doesn\'t?';
    }
    if (_has(q, ['hash', 'dictionary', 'map'])) {
      return 'Why does a hash table look up in O(1) instead of O(n) like a list? '
          'What does the hash function actually do?';
    }
    if (_has(q, ['sort', 'bubble', 'quick', 'merge'])) {
      return _pick([
        'Which sorting algorithm is simplest but slowest on large data? '
            'Why does bubble sort have O(n²) complexity?',
        'You have an array of a million elements. Bubble sort or Quick sort? '
            'Explain in your own words why one is faster.',
      ]);
    }
    if (_has(q, ['complexity', 'big o', 'o(n)', 'asymptot'])) {
      return 'If a loop goes through an array, that\'s O(n). '
          'What if there\'s another loop inside over the same array? What\'s the complexity and why?';
    }
    if (_has(q, ['recursion', 'recursive'])) {
      return 'What happens if a recursive function has no base case? '
          'What happens to the call stack?';
    }
    if (_has(q, ['sql injection', 'inject'])) {
      return 'Imagine a login form. The user types: `admin\'--`. '
          'What happens to the SQL query? Why is this dangerous?';
    }
    if (_has(q, ['rest', 'api', 'endpoint', 'http'])) {
      return _pick([
        'What HTTP methods do you know? How does GET differ from POST — not just syntactically but semantically?',
        'What does "stateless" mean in REST? Why doesn\'t the server store session state between requests?',
      ]);
    }
    if (_has(q, ['jwt', 'token', 'auth'])) {
      return 'What three parts make up a JWT token? '
          'What\'s in the payload, and why shouldn\'t you store sensitive data there?';
    }
    if (_has(q, ['flutter', 'dart', 'widget'])) {
      return _pick([
        'What\'s the difference between StatefulWidget and StatelessWidget? '
            'When would you use each — give an example.',
        'What are the Widget Tree, Element Tree and RenderObject Tree? Why are there three?',
      ]);
    }
    if (_has(q, ['git', 'branch', 'merge', 'rebase', 'commit'])) {
      return 'What\'s the difference between git merge and git rebase? '
          'What happens to the commit history in each case?';
    }
    if (_has(q, ['solid', 'dry', 'principle', 'clean code'])) {
      return 'Let\'s start with S — Single Responsibility. '
          'What does "a class should have only one reason to change" mean? '
          'Give an example of violating it.';
    }
    if (_has(q, ['thank', 'got it', 'understand', 'makes sense'])) {
      return _pick([
        'Great! Now try to explain it in your own words, as if to a friend. '
            'That\'s the best way to check your understanding.',
        'Good! Can you think of one real-world example where this concept applies?',
      ]);
    }
    if (turn == 0) {
      return 'Interesting question! What do you already know about this topic? '
          'Even a little helps me understand where to start.';
    }
    return _pick([
      'Try to describe the problem in your own words, as if explaining to someone non-technical.',
      'What would happen if you did the opposite? Sometimes it\'s easier to understand a concept in reverse.',
      'Good progress! Try to summarize the main takeaway in one sentence.',
    ]);
  }

  // ── UZBEK ─────────────────────────────────────────────────────────────────

  static String _respondUz(String q, int turn) {
    if (_has(q, ['salom', 'assalomu', 'xayrli', 'hello'])) {
      return 'Salom! Men sizning AI-Muallimingizman. Sokrat metodidan foydalanaman — '
          'tayyor javob bermasdan, yo\'naltiruvchi savollar orqali siz o\'zingiz yechimga kelasiz.\n\n'
          'Bugun qaysi mavzuni o\'rganmoqchisiz? OOP, algoritmlar, ma\'lumotlar bazasi, Flutter?';
    }
    if (_has(q, ['polimorfizm', 'polymorphism'])) {
      return _pick([
        'Ajoyib savol! Bir xil metod har xil obyektlarda chaqirilsa nima bo\'ladi? '
            'Natija nima uchun farq qilishi mumkin?',
        '«Hayvon» klassi sound() metodiga ega. It va mushuk uchun u nima qaytaradi? '
            'Bu polimorfizm bilan qanday bog\'liq?',
      ]);
    }
    if (_has(q, ['meros', 'inheritance'])) {
      return 'Meros umuman nima uchun kerak? Agar u bo\'lmaganida kod qanday bo\'lardi? '
          'Buni o\'ylab ko\'ring.';
    }
    if (_has(q, ['inkapsulyatsiya', 'encapsulation'])) {
      return 'Nima uchun barcha maydonlarni ommaviy (public) qilmaymiz? '
          'Agar har qanday kod istalgan maydonni to\'g\'ridan-to\'g\'ri o\'zgartira olsa nima yomon bo\'lardi?';
    }
    if (_has(q, ['abstrakt', 'interface', 'interfeys'])) {
      return 'Abstrakt klass va interfeys orasidagi farq nima? '
          'Kamida bitta farqni aytib bering — keyin chuqurroq kiramiz.';
    }
    if (_has(q, ['stek', 'stack'])) {
      return 'Stekda qaysi element birinchi olinadi — birinchi qo\'yilgan yoki oxirgi? '
          'Bu nima uchun LIFO deyiladi?';
    }
    if (_has(q, ['navbat', 'queue'])) {
      return 'Do\'kondagi kassada navbatni tasavvur qiling. Kim birinchi xizmat oladi? '
          'Bu dasturlashda qanday ataladi — FIFO yoki LIFO?';
    }
    if (_has(q, ['daraxt', 'tree'])) {
      return 'Daraxt bog\'liq ro\'yxatdan qanday farq qiladi? '
          'Daraxt tugunining ro\'yxat tugunida bo\'lmagan asosiy xususiyati nima?';
    }
    if (_has(q, ['xesh', 'hash', 'lug\'at'])) {
      return 'Nima uchun xesh-jadvalda qidiruv O(1) da ishlaydi, ro\'yxatdagi O(n) ga nisbatan? '
          'Xesh-funksiya nima qiladi?';
    }
    if (_has(q, ['saralash', 'sort', 'bubble', 'tez saralash'])) {
      return 'Qaysi saralash eng oddiy lekin katta ma\'lumotlarda eng sekin? '
          'Nima uchun pufakcha saralash O(n²) murakkablikka ega?';
    }
    if (_has(q, ['murakkablik', 'big o', 'o(n)'])) {
      return 'Tsikl massiv bo\'ylab o\'tsa — bu O(n). '
          'Agar tsikl ichida yana bir tsikl bo\'lsa — murakkablik qanday bo\'ladi? Nima uchun?';
    }
    if (_has(q, ['rekursiya', 'recursion'])) {
      return 'Agar rekursiv funksiyaning asosiy holati bo\'lmasa nima bo\'ladi? '
          'Chaqiruv stegi bilan nima sodir bo\'ladi?';
    }
    if (_has(q, ['sql-inyeksiya', 'sql inject', 'inyeksiya'])) {
      return 'Login formasini tasavvur qiling. Foydalanuvchi kiradi: `admin\'--`. '
          'SQL so\'roviga nima bo\'ladi? Bu nima uchun xavfli?';
    }
    if (_has(q, ['rest', 'api', 'http'])) {
      return 'Qanday HTTP metodlarini bilasiz? GET va POST qanday farq qiladi — '
          'nafaqat sintaktik, balki semantik jihatdan ham?';
    }
    if (_has(q, ['jwt', 'token', 'autentifikatsiya'])) {
      return 'JWT token qanday uch qismdan iborat? '
          'Payload da nima saqlanadi va u yerga nima uchun maxfiy ma\'lumot qo\'yib bo\'lmaydi?';
    }
    if (_has(q, ['flutter', 'dart', 'widget'])) {
      return 'StatefulWidget va StatelessWidget orasidagi farq nima? '
          'Qachon qaysi birini ishlatish kerak — misol keltiring.';
    }
    if (_has(q, ['git', 'branch', 'merge', 'rebase'])) {
      return 'Git merge va git rebase orasidagi farq nima? '
          'Har bir holda commit tarixi bilan nima sodir bo\'ladi?';
    }
    if (_has(q, ['rahmat', 'tushundim', 'tushunarli', 'yaxshi'])) {
      return _pick([
        'Ajoyib! Endi buni do\'stingizga tushuntirgandek o\'z so\'zlaringiz bilan aytib bering. '
            'Bu tushunishni tekshirishning eng yaxshi usuli.',
        'Yaxshi! Bu kontseptsiya qo\'llaniladigan bitta real hayot misolini o\'ylab toping.',
      ]);
    }
    if (turn == 0) {
      return 'Qiziqarli savol! Bu mavzu haqida nima bilasiz? '
          'Ozgina bo\'lsa ham — qayerdan boshlashni tushunishga yordam beradi.';
    }
    return _pick([
      'Muammoni texnik bo\'lmagan odamga tushuntirgandek o\'z so\'zlaringiz bilan tavsiflang.',
      'Aksincha qilsangiz nima bo\'lardi? Ba\'zan teskari tomondan tushunish osonroq.',
      'Yaxshi! Asosiy xulosani bir gapda bayon etib ko\'ring.',
    ]);
  }

  // ── helpers ───────────────────────────────────────────────────────────────

  static bool _has(String q, List<String> kw) => kw.any((k) => q.contains(k));
  static String _pick(List<String> opts) => opts[_rng.nextInt(opts.length)];
}

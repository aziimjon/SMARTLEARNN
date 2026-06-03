import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/models/ai_message.dart';
import '../../data/repositories/ai_coach_repository_impl.dart';
import '../../domain/repositories/ai_coach_repository.dart';

// ── Repository provider (no injectable — instantiated directly) ──────────────

final aiCoachRepositoryProvider = Provider<AiCoachRepository>(
  (ref) => AiCoachRepositoryImpl(getIt<DioClient>()),
);

// ── State ────────────────────────────────────────────────────────────────────

class AiChatState {
  final List<AiMessage> messages;
  final bool isLoading;
  final String? errorMessage;

  const AiChatState({
    required this.messages,
    required this.isLoading,
    this.errorMessage,
  });

  AiChatState copyWith({
    List<AiMessage>? messages,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AiChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

// ── Notifier ─────────────────────────────────────────────────────────────────

class AiChatNotifier extends StateNotifier<AiChatState> {
  final AiCoachRepository _repository;

  AiChatNotifier(this._repository)
      : super(const AiChatState(messages: [], isLoading: false));

  Future<void> sendMessage(String text, {String locale = 'ru'}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isLoading) return;

    final userMsg = AiMessage(
      id: '${DateTime.now().millisecondsSinceEpoch}_u',
      text: trimmed,
      isUser: true,
      createdAt: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg],
      isLoading: true,
      clearError: true,
    );

    final result = await _repository.sendMessage(
      message: trimmed,
      history: state.messages,
      locale: locale,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (reply) {
        final aiMsg = AiMessage(
          id: '${DateTime.now().millisecondsSinceEpoch}_ai',
          text: reply,
          isUser: false,
          createdAt: DateTime.now(),
        );
        state = state.copyWith(
          messages: [...state.messages, aiMsg],
          isLoading: false,
        );
      },
    );
  }

  void clearError() => state = state.copyWith(clearError: true);
}

// ── Provider ─────────────────────────────────────────────────────────────────

final aiChatNotifierProvider =
    StateNotifierProvider<AiChatNotifier, AiChatState>(
  (ref) => AiChatNotifier(ref.read(aiCoachRepositoryProvider)),
);

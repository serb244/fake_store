part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LanguageChangeEvent extends LanguageEvent {
  final String language;

  const LanguageChangeEvent(this.language);

  @override
  List<Object?> get props => [language];
}

class LanguageSaveEvent extends LanguageEvent {
  final Language language;

  const LanguageSaveEvent(this.language);

  @override
  List<Object?> get props => [language];
}

class LanguageDeleteEvent extends LanguageEvent {
  final int languageId;

  const LanguageDeleteEvent({ required this.languageId});

  @override
  List<Object?> get props => [languageId];
}
class LanguageInitEvent extends LanguageEvent {
  // final int languageId;

  const LanguageInitEvent( );

  @override
  List<Object?> get props => [];
}
class LanguageErrorEvent extends LanguageEvent {
  final  String message;

  const LanguageErrorEvent({ required this.message});

  @override
  List<Object?> get props => [message];
}
class LanguageLoadedEvent extends LanguageEvent {
  final  List<Language> languages;

  const LanguageLoadedEvent({ required this.languages});

  @override
  List<Object?> get props => [languages];
}



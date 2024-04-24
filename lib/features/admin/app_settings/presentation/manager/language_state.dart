part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object> get props => [];
}

class LanguageLoadingState extends LanguageState {
  @override
  List<Object> get props => [];

  const LanguageLoadingState();
}

class LanguageLoadedState extends LanguageState {
  final List<Language> languageList;

  const LanguageLoadedState({required this.languageList});

  @override
  List<Object?> get props => [languageList];
}

class LanguageErrorState extends LanguageState {
  final String error;

  @override
  List<Object> get props => [error];

  const LanguageErrorState({required this.error});
}

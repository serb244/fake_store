import 'package:equatable/equatable.dart';
import 'package:fake_store/core/data/models/language/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repository/language_repository.dart';
import '../../error/exceptions.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository languageRepository;
  List<Language> allLanguages = [];

  LanguageBloc({required this.languageRepository}) : super(LanguageInitial()) {
    on<LanguageSaveEvent>(_save);
    on<LanguageInitEvent>(_init);
    on<LanguageLoadedEvent>(_loaded);
    on<LanguageErrorEvent>(_error);
    on<LanguageDeleteEvent>(_delete);
    languageRepository.languageStream.listen((Either<BaseException, List<Language>> eitherCategoriesOrException) {
      eitherCategoriesOrException.fold(
        (exception) {
          print("exception ${exception.userMessage}");
          add(LanguageErrorEvent(message: exception.userMessage.toString()));
        },
        (List<Language> res) {
          print("res ${res.length}");
          allLanguages = res;
          add( LanguageLoadedEvent(languages: allLanguages));
        },
      );
    });
    print("LanguageBloc constructor");
  }
  _loaded (LanguageLoadedEvent event, Emitter<LanguageState> emit) async {
    emit(const LanguageLoadingState());
    emit(LanguageLoadedState(languageList: allLanguages));
  }
  _error(LanguageErrorEvent event, Emitter<LanguageState> emit) async {
    emit(const LanguageLoadingState());
    emit(LanguageErrorState(error: event.message));
  }

  _delete(LanguageDeleteEvent event, Emitter<LanguageState> emit) async {
    emit(const LanguageLoadingState());
    // final result = await categoryRepository.deleteCategory(categoryId: event.categoryId);
  }

  _init(LanguageInitEvent event, Emitter<LanguageState> emit) async {
    emit(const LanguageLoadingState());
    final res = await languageRepository.getAllLanguages(force: event.force);
    print("LanguageInitEvent res ${res.toString()}");
    // res.fold(
    //   (l) => emit(LanguageErrorState(error: l.userMessage.toString())),
    //   (List<Language> r) {
    //     emit(LanguageLoadedState(languageList: r));
    //   },
    // );
  }

  _save(LanguageSaveEvent event, Emitter<LanguageState> emit) async {
    emit(const LanguageLoadingState());
    await languageRepository.saveLanguage(language: event.language);
    // emit(const AdminCategoryLoading());
    // await categoryRepository.addCategory(categoryModel: event.category);
    // emit(AdminCategoryLoaded(category: event.category, allCategories: allCategories));
  }
}

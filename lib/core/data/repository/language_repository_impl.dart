import 'dart:async';

import 'package:fake_store/core/data/data_sources/remote/language_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/language/language.dart';
import '../../domain/repository/language_repository.dart';
import '../../error/error.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  LanguageRemoteDataSource languageRemoteDataSource;

  LanguageRepositoryImpl({
    required this.languageRemoteDataSource,
  });

  List<Language> _languages = [];

  final StreamController<Either<BaseException, List<Language>>> _controller = StreamController<Either<BaseException, List<Language>>>.broadcast();

  @override
  Stream<Either<BaseException, List<Language>>> get languageStream => _controller.stream.asBroadcastStream();

  void addToStream(Either<BaseException, List<Language>> data) => _controller.sink.add(data);

  @override
  Future<Either<BaseException, Language>> saveLanguage({required Language language, bool force = true}) async {
    try {
      final Language response = await languageRemoteDataSource.saveLanguage(language: language);
      print("addLanguage response.data : ${response.toJson()}");
      _languages.add(response);
      addToStream(Right([..._languages]));
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, bool>> deleteLanguage({required int languageId, bool force = true}) {
    // TODO: implement deleteLanguage
    throw UnimplementedError();
  }

  Future<Either<BaseException,  List<Language>>> getAllLanguagesForce() async {
    try {
      final List<Language> response = await languageRemoteDataSource.getAllLanguages();
      _languages = [...response];
      addToStream(Right(_languages));
      return  Right(_languages);
    } on BaseException catch (e) {
      addToStream(Left(e));
      return Left(e);
    }
  }

  @override
  Future<Either<BaseException,  List<Language>>> getAllLanguages({bool force = false}) async {
    if (force) {
      return await getAllLanguagesForce();
    } else {
      try {
        return Right(_languages);
      } on BaseException catch (e) {
        addToStream(left(e));
        return Left(e);
      }
    }
  }

  @override
  Future<Either<BaseException, Language>> getLanguageByID({int languageId = 0, bool force = false}) {
    // TODO: implement getLanguageByID
    throw UnimplementedError();
  }
}

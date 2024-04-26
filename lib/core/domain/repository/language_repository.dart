import 'package:fpdart/fpdart.dart';
import '../../data/models/language/language.dart';
import '../../error/error.dart';

abstract class LanguageRepository {
  Stream<Either<BaseException, List<Language>>> get languageStream;

  Future<Either<BaseException, Language>> saveLanguage({required Language language, bool force = true});

  Future<Either<BaseException, Language>> getLanguageByID({int languageId = 0, bool force = false});

  Future<Either<BaseException, bool>> deleteLanguage({required int languageId, bool force = true});

  // Future<Either<BaseException, List<Language>>> getAllLanguages({bool force = false});
  Future<Either<BaseException, List<Language>>> getAllLanguages({bool force = false});
}

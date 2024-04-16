
String createSlug(String categoryName) {
  // Convert to lowercase
  String slug = categoryName.toLowerCase();

  // Replace Cyrillic characters with Latin equivalents
  slug = slug.replaceAll('а', 'a')
      .replaceAll('б', 'b')
      .replaceAll('в', 'v')
      .replaceAll('г', 'g')
      .replaceAll('д', 'd')
      .replaceAll('е', 'e')
      .replaceAll('ё', 'e')
      .replaceAll('ж', 'zh')
      .replaceAll('з', 'z')
      .replaceAll('и', 'i')
      .replaceAll('й', 'y')
      .replaceAll('к', 'k')
      .replaceAll('л', 'l')
      .replaceAll('м', 'm')
      .replaceAll('н', 'n')
      .replaceAll('о', 'o')
      .replaceAll('п', 'p')
      .replaceAll('р', 'r')
      .replaceAll('с', 's')
      .replaceAll('т', 't')
      .replaceAll('у', 'u')
      .replaceAll('ф', 'f')
      .replaceAll('х', 'h')
      .replaceAll('ц', 'c')
      .replaceAll('ч', 'ch')
      .replaceAll('ш', 'sh')
      .replaceAll('щ', 'sch')
      .replaceAll('ъ', '')
      .replaceAll('ы', 'y')
      .replaceAll('ь', '')
      .replaceAll('э', 'e')
      .replaceAll('ю', 'yu')
      .replaceAll('я', 'ya')
      .replaceAll(' ', '-');

  // Remove non-alphanumeric characters and consecutive dashes
  slug = slug.replaceAll(RegExp(r'[^a-z0-9\-]'), '')
      .replaceAll(RegExp(r'-+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');

  return slug;
}
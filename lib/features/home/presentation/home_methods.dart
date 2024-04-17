
// List<MenuCategoryItemModel> getMenuCategoryItems(List<CategoryModel> categories) {
//   List<MenuCategoryItemModel> menuCategoryItems = [];
//   for (var category in categories) {
//     if (category.parentCategoryId == null) {
//       menuCategoryItems.add(MenuCategoryItemModel(
//         topCategory: category,
//         subCategories: [],
//       ));
//     } else {
//       for (var menuCategoryItem in menuCategoryItems) {
//         if (menuCategoryItem.topCategory.id == category.parentCategoryId) {
//           menuCategoryItem.subCategories.add(category);
//           break;
//         }
//       }
//     }
//   }
//   return menuCategoryItems;
// }
// void onTapOpenMenuCategoryItem(MenuCategoryItemModel menuCategoryItem) {
//   menuCategoryItem.isOpen = !menuCategoryItem.isOpen;
// }
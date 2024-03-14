// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Создаем класс продукта.
class RawProductItem {
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;
  const RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });
}

/// Заполняем список товарами.
List<RawProductItem> dataProduct() {
  final data = [
    RawProductItem(
      name: 'Персик',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Молоко',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Кефир',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творожок',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гауда',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2022, 12, 22),
      qty: 3,
    ),
    RawProductItem(
      name: 'Маасдам',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2022, 12, 22),
      qty: 2,
    ),
    RawProductItem(
      name: 'Яблоко',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 4),
      qty: 4,
    ),
    RawProductItem(
      name: 'Морковь',
      categoryName: 'Растительная пища',
      subcategoryName: 'Овощи',
      expirationDate: DateTime(2022, 12, 23),
      qty: 51,
    ),
    RawProductItem(
      name: 'Черника',
      categoryName: 'Растительная пища',
      subcategoryName: 'Ягоды',
      expirationDate: DateTime(2022, 12, 25),
      qty: 0,
    ),
    RawProductItem(
      name: 'Курица',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 18),
      qty: 2,
    ),
    RawProductItem(
      name: 'Говядина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Телятина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Индюшатина',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Утка',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 18),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гречка',
      categoryName: 'Растительная пища',
      subcategoryName: 'Крупы',
      expirationDate: DateTime(2022, 12, 22),
      qty: 8,
    ),
    RawProductItem(
      name: 'Свинина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 23),
      qty: 5,
    ),
    RawProductItem(
      name: 'Груша',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 25),
      qty: 5,
    ),
  ];
  return data;
}

void main(List<String> arguments) {
  /// Получаем список товаров.
  final data = dataProduct();

  /// Устанавливаем дату годности, по которой будет фильтроваться товар.
  final dateExpiration = DateTime(2022, 12, 21);

  /// Фильтруем список товаров, удалив из него просроченные и отсутствующие товары.
  final filterData = data
      .where((e) => e.expirationDate.isAfter(dateExpiration) && e.qty > 0)
      .toList();

  /// Формируем пустые выходные данные.
  final Map<String, Map<String, List<String>>> outputData = {};

  /// Перебираем список подготовленных данных и заполняем выходные данные.
  for (var elementData in filterData) {
    /// Если в выходных данных есть категория - переходим к подкатегориям.
    if (outputData.containsKey(elementData.categoryName)) {
      /// Получаем значения категории.
      final currentCategoryValue = outputData[elementData.categoryName];

      /// Проверяем на всякий случай на null
      if (currentCategoryValue == null) {
        print('Нет значений в категории');
      } else {
        /// Категория есть, теперь проверим, а есть ли уже в выходных данных подктегория
        if (currentCategoryValue.containsKey(elementData.subcategoryName)) {
          /// Если подкатегория есть - получаем список товаров подкатегории
          final currentSubCategoryValue =
              currentCategoryValue[elementData.subcategoryName];
          print('Есть субкатегория');

          /// Проверяем список товаров на null
          if (currentSubCategoryValue == null) {
            print('Нет товаров в субкатегории');
            //currentSubCategoryValue = [elementData.name];
          } else {
            /// Если в списке товаров нет текущего товара - добавляем в список
            if (!currentSubCategoryValue.contains(elementData.name)) {
              currentSubCategoryValue.add(elementData.name);
            }
          }
        } else {
          /// Если подкатегории нет - добавляем ее в выодные данные вместе с текущим товаром
          currentCategoryValue[elementData.subcategoryName] = [
            elementData.name
          ];
          print('Нет субкатегория');
        }
      }
    } else {
      /// Если нет категории в выходных данных - добавим категорию, подкатегорию и наименование товара
      outputData[elementData.categoryName] = {
        elementData.subcategoryName: [elementData.name]
      };
    }
  }

  /// Закончили формировать выходные данные - теперь выведем в консоль
  print(outputData);
}

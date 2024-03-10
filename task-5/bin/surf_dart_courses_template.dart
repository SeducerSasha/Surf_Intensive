// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Создаем абстрактный класс фильтрации.
abstract interface class Filter<T> {
  /// Определяем значение фильтрации.
  final T filterCondition;

  Filter(this.filterCondition);

  /// Выполняем функцию фильтрации. В качестве результата возвращается, подходит товар под условие фильтра или нет.
  bool apply(final Article article, filterCondition);
}

/// Реализация фильтрации по цене (не больше указанной).
class FilterPrice implements Filter<int> {
  @override
  int filterCondition;

  @override
  bool apply(Article article, filterCondition) =>
      article.price <= this.filterCondition;

  FilterPrice(this.filterCondition);
}

/// Реализация фильтрации по количеству (меньше указанной).
class FilterCount implements Filter<int> {
  @override
  int filterCondition;

  @override
  bool apply(Article article, filterCondition) =>
      article.count < this.filterCondition;

  FilterCount(this.filterCondition);
}

/// Реализации фильтрации по категории.
class FilterCategory implements Filter<String> {
  @override
  String filterCondition;

  @override
  bool apply(Article article, filterCondition) =>
      article.category == this.filterCondition;

  FilterCategory(this.filterCondition);
}

/// Функция фильтрации по списку товаров и указанному условию.
void applyFilter(final List<Article> articles, Filter filter) {
  var listPrice = articles.where((element) => filter.apply(element, filter));

  /// После получения списка товаров, удовлетворяющих условию, выводим их в консоль.
  listPrice.forEach((element) {
    print(element);
  });
}

/// Описание класса товара: идентификатор, категория, наименование, цена, количество.
class Article {
  final int id;
  final String category;
  final String name;
  final int price;
  final int count;

  Article({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.count,
  });

  /// Переопределение вывода в консоль: значения разделяются табуляцией, выводится наименование валюты и наименование единицы измерения.
  @override
  String toString() {
    return '$id\t$category\t$name\t$price рублей\t$count шт';
  }
}

void main() {
  /// Список товаров в строковом виде.
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  /// Сначала нужно забить строку товаров на список строк. В качестве разделителя используем перенос строки.
  var listStringArticles = articles.split('\n');

  /// Опеределяем пустой список будущих товаров.
  List<Article> listArticles = [];

  /// Обходим список строковых описаний товаров.
  listStringArticles.forEach(
    (element) {
      /// Каждая строка разбивается в список будущего товара, используя в качестве разделителя запятую.
      final listProperty = element.split(',');

      /// Если полученный список не пустой - создаеем объект товара.
      if (listProperty[0].isNotEmpty) {
        final newArticle = Article(
          id: int.parse(listProperty[0]),
          category: listProperty[1],
          name: listProperty[2],
          price: int.parse(listProperty[3]),
          count: int.parse(listProperty[4]),
        );

        /// После создания обхекта товара добвляем его в результирующий список товаров.
        listArticles.add(newArticle);
      }
    },
  );

  /// Применим к списку товаров фильтр по цене и выведем в консоль результат.
  print('Фильтрация по цене <= 50');
  applyFilter(listArticles, FilterPrice(50));

  /// Применим к списку товаров фильтр по количеству и выведем в консоль результат.
  print('Фильтрация по количеству < 20');
  applyFilter(listArticles, FilterCount(20));

  /// Применим к списку товаров фильтр по категории и выведем в консоль результат.
  print('Фильтрация по категории "хлеб"');
  applyFilter(listArticles, FilterCategory('хлеб'));
}

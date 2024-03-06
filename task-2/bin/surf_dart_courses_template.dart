// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Тип автомобиля: легковой, грузовой.
enum TypeAutomobile { passenger, truck }

/// Тип клиента: физическое лицо, юридическое лицо.
enum TypeClient { naturalPerson, legalEntity }

/// Класс "Клиенты". У клиента необязательными могут быть бонусная карта и автомбили.
class Client {
  final String name;
  BonusCard? card;
  List<Automobile>? automobile;
  TypeClient typeClient;

  Client({
    required this.name,
    required this.typeClient,
  }) : automobile = [];

  /// Для быстрого создания клиента-физического лица.
  Client.naturalPerson({
    required this.name,
  })  : typeClient = TypeClient.naturalPerson,
        automobile = [];

  /// Для быстрого создания клиента-юридического лица.
  Client.legalEntity({
    required this.name,
  })  : typeClient = TypeClient.legalEntity,
        automobile = [];

  /// Добавление клиенту бонусной карты.
  void addCard(final String codeCard) {
    card = BonusCard(code: codeCard);
  }

  /// Добавление клиенту автомобиля.
  void addAutomobile(final Automobile newAutomobile) {
    automobile?.add(newAutomobile);
  }

  /// Переопределим вывод информации
  @override
  String toString() {
    return 'Клиент: $name, бонусная карта: ${card == null ? 'нет' : card!.code + ', баланс: ' + card!.balance.toString()}, автомобили: ${automobile}, тип клиента: ${typeClient == TypeClient.naturalPerson ? 'физ.лицо' : 'юр.лицо'})';
  }
}

/// Класс "Бонусная карта". Баланс по умолчанию равен нули и у нему нет доступа напрямую.
class BonusCard {
  final String code;
  int _balance = 0;

  BonusCard({
    required this.code,
  });

  /// Позволяет получить текущий баланс карты
  int get balance => _balance;

  /// Позволяет добавить на баланс карты бонусы.
  void addBalance(final int count) {
    _balance += count;
  }

  /// Позволяет вычесть из баланса карты бонусы.
  void removeBalance(final int count) {
    _balance -= count;
  }
}

/// Класс "Автомобиль". Обызательно нужно указать имя, VIN и тип автомобиля
class Automobile {
  final String name;
  final String vin;
  final TypeAutomobile typeAutomobile;
  const Automobile({
    required this.name,
    required this.vin,
    required this.typeAutomobile,
  });

  /// Переопределим вывод информации
  @override
  String toString() => '$name';
}

void main(List<String> arguments) {
  /// Создание автомобилей
  var auto1 = Automobile(
      name: 'Lada',
      vin: 'qwe1rew2tr4',
      typeAutomobile: TypeAutomobile.passenger);

  var auto2 = Automobile(
      name: 'КАМАЗ',
      vin: 'asdfg5hytr786',
      typeAutomobile: TypeAutomobile.truck);

  var auto3 = Automobile(
      name: 'KIA',
      vin: 'yuhny56kiu834',
      typeAutomobile: TypeAutomobile.passenger);

  /// Создание клиента
  var client_1 =
      Client(name: 'Вася Пупкин', typeClient: TypeClient.naturalPerson);
  client_1.addCard('111');
  client_1.addAutomobile(auto1);
  client_1.addAutomobile(auto3);
  client_1.card?.addBalance(120);

  print(client_1);

  var client_2 = Client.legalEntity(name: 'ООО Солнышко');
  client_2.addAutomobile(auto2);

  print(client_2);
}

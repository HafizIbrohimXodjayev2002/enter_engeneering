class FakeData {
  final int id;
  final String company;
  final String incomes;
  final String inMarket;
  final String directors;
  final String employees;
  final String techniques;

  const FakeData({
    required this.inMarket,
    required this.directors,
    required this.employees,
    required this.techniques,
    required this.company,
    required this.incomes,
    required this.id,
  });

  static List<FakeData> getData() {
    return <FakeData>[
      const FakeData(
        company: "ERIELL JMBH",
        incomes: "23 Billion",
        id: 1,
        directors: "Филатов Поликарп Елисеевич",
        inMarket: "25 лет",
        employees: "+25000",
        techniques: "+3500",
      ),
      const FakeData(
        company: "АНДИЖАННЕФТЬ АО",
        incomes: "18 Billion",
        id: 2,
        directors: "Лихачев Лев Антипович",
        inMarket: "12 лет",
        employees: "+13000",
        techniques: "+1700",
      ),
      const FakeData(
        company: "ЖАРКУРГОННЕФТ АО",
        incomes: "14 Billion",
        id: 3,
        directors: "Селезнев Ярополк Тихонович",
        inMarket: "8 лет",
        employees: "+1200",
        techniques: "+600",
      ),
      const FakeData(
        company: "МУБАРЕКНЕФТЕГАЗ ООО",
        incomes: "12 Billion",
        id: 4,
        directors: "Илья Тимурович Воронцов",
        inMarket: "9 лет",
        employees: "+11200",
        techniques: "+1300",
      ),
      const FakeData(
        company: "РАВШАННЕФТЕГАЗ ООО",
        incomes: "5 Billion",
        id: 5,
        directors: "Серафим Жоресович Филиппов",
        inMarket: "2 лет",
        employees: "+1200",
        techniques: "+300",
      ),
      const FakeData(
        company: "ИБРОХИМНЕФТЕГАЗ ООО",
        incomes: "5 Billion",
        id: 6,
        directors: "Пахомов Архип Абрамович",
        inMarket: "4 лет",
        employees: "+1200",
        techniques: "+370",
      ),
      const FakeData(
        company: "ДЕНИСНЕФТЕГАЗ ООО",
        incomes: "7 Billion",
        id: 7,
        directors: "Дорофей Георгиевич Блохин",
        inMarket: "8 лет",
        employees: "+10260",
        techniques: "+1130",
      ),
    ];
  }

  static const Map<String, double> dataMap = {
    "ERIELL JMBH": 6,
    "АНДИЖАННЕФТЬ АО": 3,
    "ЖАРКУРГОННЕФТ АО": 2,
    "МУБАРЕКНЕФТЕГАЗ ООО": 2,
  };
}

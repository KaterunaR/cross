import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Моря світу",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SeaListPage(),
    );
  }
}

class Sea {
  final String name;
  final String description;
  final String imagePath;

  Sea(this.name, this.description, this.imagePath);
}

// Список морів
final List<Sea> seas = [ 
  Sea("Чорне море", 
      "Чорне море — це внутрішнє море басейну Атлантики, відоме своєю унікальною двошаровою екосистемою: верхній шар насичений киснем, а глибинні води (понад 150-200 м) повністю насичені сірководнем, що робить життя там майже неможливим, окрім анаеробних бактерій.", 
      "assets/images/black.png"), 
  Sea("Азовське море", 
      "Азовське море — наймілкіше у світі напівзамкнене море Атлантичного басейну біля України, сполучене з Чорним морем через Керченську протоку. Воно вирізняється малою глибиною (пересічно 8 м, макс. 15 м), низькою солоністю (особливо через вливання прісних вод Дону та Кубані), що робить його дуже продуктивним, але взимку схильним до замерзання. Характерні низовинні береги з численними косами (Арабатська стрілка, Бердянська коса), а влітку спостерігається води від планктону. ", 
      "assets/images/azov.png"), 
  Sea("Середземне море", 
      "Середзе́мне мо́ре — внутрішнє, міжматерикове море Атлантичного океану між Європою, Азією і Африкою. Омиває береги Іспанії, Франції, Італії, Монако, Мальти, Боснії і Герцеговини, Чорногорії, Хорватії, Словенії, Албанії, Греції, Туреччини, Республіки Кіпр, Сирії, Лівану, Ізраїлю, Єгипту, Лівії, Тунісу, Алжиру та Марокко. Гібралтарською протокою сполучене з Атлантичним океаном. Площа — 2 505 000 км², глибина — до 5 121 м (середня — 1 536 м).", 
      "assets/images/seredzemne.jpg"), 
  Sea("Японське море", 
      "Япо́нське мо́ре або Східне море (яп. 日本海, Nihon kai; півд. кор. 동해, Donghae; півн. кор. 조선동해, Chosŏn Tonghae) — напівзамкнуте море Тихого океану, між материком Євразією та його Корейським піостровом і Японським архіпелагом та островом Сахаліном. Омиває береги Японії, Російської Федерації, Південної й Північної Кореї. Площа 1 062 000 км²[a],глибина до 3 742 м, солоність морської води 33,7 — 34,8‰.", 
      "assets/images/japan.png"), 
  Sea("Жовте море", 
      "Води моря омивають береги трьох держав Східної Азії — Китаю, КНДР та Південної Кореї. За даними Енциклопедії Британніка довжина моря з півночі на південь складає близько 960 км і близько 700 км — зі сходу на захід. Площа — 416 тис. км²; середній об'єм води — 16 тис. км³; середня глибина — 38 м; найбільша глибина 106 м. Глибини рівномірно збільшуються із півночі на південь до 84—92 м, на крайньому південному сході — до 106 м. Ґрунт — мул і пісок.", 
      "assets/images/yellow.jpg"), 
  Sea("Море Ванделя", 
      "Море Ванделя (англ. Wandel Sea, дан. Wandel Hav, дан. Wandelhavet, також відомо в США як англ. McKinley Sea[1]) — неофіційна назва[2] частини Північного Льодовитого океану, розташованого між мисом Нордоструннінген і Землею Пірі[3]. Водний простір північніше і східніше моря Ванделя цілорічно покрито льодом. На захід від моря розташовуються дві найбільші затоки Гренландії: фіорди Індепенденс і Данмарк[4]. На північний захід розташоване море Лінкольна. Обмежено 82° північної широти і 21° західної довготи, на заході, обмежено мисом Морріс-Джесуп. На півдні, воно тягнеться до Нореструннінген. Море Ванделя з'єднується з Гренландським морем на півдні протокою Фрама.", 
      "assets/images/Wandel_Sea_map.png"), ];


class SeaListPage extends StatefulWidget {
  const SeaListPage({super.key});

  @override
  State<SeaListPage> createState() => _SeaListPageState();
}

class _SeaListPageState extends State<SeaListPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 900, 
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // список морів
              Container(
                width: 200,
                color: Colors.blue[100],
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: seas.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 16, color: Colors.blue),
                  itemBuilder: (context, index) {
                    final sea = seas[index];
                    return ListTile(
                      title: Text(sea.name, style: const TextStyle(fontSize: 18)),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      selected: index == selectedIndex,
                      selectedTileColor: Colors.black12,
                    );
                  },
                ),
              ),

              // фото та опис
              Expanded(
                child: Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(16),
                  child: selectedIndex == -1
                      ? const Center(
                          child: Text(
                            "Моря не вибрано",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              seas[selectedIndex].imagePath,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              seas[selectedIndex].name,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  seas[selectedIndex].description,
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

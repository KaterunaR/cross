// Створити абстрактний клас Домашня тварина і підкласи Собака, Кішка,
// Папуга. За допомогою конструктора встановити ім'я кожної тварини і її
// характеристики.


abstract class Pet {
  String name = 'aa';
  int age;

  Pet(this.name, this.age);

  void makeSound();
  void showInfo();
}

class Dog extends Pet {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print('$name barks: Woof Woof!');
  }

  @override
  void showInfo() {
    print('Dog: $name, Age: $age years, Breed: $breed');
  }

  void play() {
    print("$name likes playing!");
  }
}


class Cat extends Pet {
  String color;

  Cat(String name, int age, this.color) : super(name, age);

  @override
  void makeSound() {
    print('$name meows: Meow!');
  }

  @override
  void showInfo() {
    print('Cat: $name, Age: $age years, Color: $color');
  }
}


class Parrot extends Pet {
  bool canTalk;

  Parrot(String name, int age, this.canTalk) : super(name, age);

  @override
  void makeSound() {
    if (canTalk) {
      print('$name says: Hello!');
    } else {
      print('$name squawks: Squawk!');
    }
  }

  @override
  void showInfo() {
    print('Parrot: $name, Age: $age years, Can Talk: ${canTalk? 'yes' : 'no'}');
  }

  void repeat() {
    print("$name repeats after you!");
  }
}

void main() {
  Dog dog = Dog('Wolf', 3, 'Golden Retriever');
  Cat cat = Cat('Oliver', 2, 'Black');
  Parrot parrot = Parrot('Polly', 56, true);

  print("------------------------------------------------------");
  dog.showInfo();
  dog.makeSound();
  dog.play();
  print("------------------------------------------------------");
  cat.showInfo();
  cat.makeSound();
  print("------------------------------------------------------");
  parrot.showInfo();
  parrot.makeSound();
  parrot.repeat();
  print("------------------------------------------------------");
}

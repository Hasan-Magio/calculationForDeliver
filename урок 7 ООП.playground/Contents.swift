// ПРОДОЛЖАЕМ ГОВОРИТЬ О КЛАССАХ И СТРУКТУРАХ

///хранимое свойство / это обычное свойство, которое хранит в себе какое/то значение
///вычисляемое свойство  get set не хранит в себе какое/то значение, занимается переадресацией
///
///
///SELF Используется только внутри класса
///
//Объектно-ориентированное программирование это методология программирования основанная на представлении программы Вити объекта который в свою очередь является экземпляром виде совокупности объектов которые являются экземпляром определённого класса принципами алло появляется абстракция Инкапсуляция Полиморфизм и наследование


//                          принципы ООП
///                инкапсуляция
///             абстракция
///           наследование
///        полиморфизм
///
///                 АБСТРАКЦИЯ - является одним из основных принципов ООП, позволяет работать с объектами  не вдаваясь в особенности реализации
/// абстракция на примере зажигалки. чтобы зажесь я надавливаю на кремень закрепленный посередние, после чего он трется об метал создавая искру, которую в свою очередь
/// подхватывает газ, выпускаемый при нажатии на газовую педаль   -----  ПРОЩЕ ГОВОРЯ МЫ ЗАЖИГАЕМ ЗАЖИГАЛКУ - THIS IS ABSTRACTION








///                 ИНКАПСУЛЯЦИЯ - СКРЫТИЕ внутренней реализации от других компонентов. Например доступ к переменной может осуществляться не напрямую а через геттер и сеттер
/// это как бы поместить что-то в капсулe.   Что у нас может быть в капсуле??    CLASS  METHODS VARIABLES  и так далее
/// Инкапсуляция на примере ноутбука!  Есть ноутбук! У нас есть монитор есть тачпад - мы работаем не вдаваясь в точечные подробности строения ноутбука




//                                  Уровни доступа (модификаторы доступа)
/// Частный (private). Этот уровень доступа позволяет использоваться сущность только в пределах области ее реализации.    Если метод или выражение обозначены словом private значит мы можем обращаться к нему только внутри Class
///
///
/// Файл частный (file privat). Этот уровень доступа позволяет использовать объект в пределах его исходного файла.        Можем вызвать только внутри файла метод





// Инкапсуляция

//class Post {
//    var title: String
//    var body: String
//    var author: String
//
//    var description: Int {
//        get {
//            numberOfComment
//        }

//    }
//
//    private var numberOfComment = 0  // здесь (private) теперь частный доступ
//
//    init(title: String, body: String, author: String) {
//        self.title = title
//        self.body = body
//        self.author = author
//    }
//
//
//    // метод добавляет комментарии
//    func addComment() {
//        numberOfComment += 1
//        print("Комментарий № \(numberOfComment) добавлен")
//    }
//}
//
//let firstPost = Post(
//    title: "My name is Bob",
//    body: "I am from Uta",
//    author: "Bob")


//firstPost.addComment()
//firstPost.addComment()
//print("The number of coments for the post \(firstPost.title) is \(firstPost.description)")




                                // НАСЛЕДОВАНИЕ
    // Класс может наследовать методы от другого класса его методы и характеристики
    /// Когда один класс наследуется от другого он назвается подклассом, или наследников
/// класс от которого наследуются называется супер классом
/// Класс у которых не указан супер класс считается базовым, и далее от него уже от него могут наследоваться
/// В свифт можно получаться доступ к свойствам и методам суперкласса если они изначально не private

/// В свифте нет множественного наследования / это и не надо

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        "движется co скоростью \(currentSpeed) миль в час"
    }

    func makeNoise() {
    // здесь пока ничего не пишем, так как не каждый транспорт издает шум
    }
}


let vehicle1 = Vehicle()
vehicle1.currentSpeed = 74
print("Транспорт \(vehicle1.description)")



                            // НАСЛЕДОВАНИЕ ПОДКЛАССОМ

class Bicycle: Vehicle {
    var hasBasket = false
    
    override func makeNoise() {
        print("Тынь дынь")
    }
}

let bicycle1 = Bicycle()
bicycle1.hasBasket = true
bicycle1.currentSpeed = 10.5        // обращаемся к свойству суперкласса, так как там свойство скорости уже задана
print("Велосипед движется со скоростью \(bicycle1.currentSpeed)")




        
                        // ПОЛИМОРФИЗМ - метод один а реализация разная
                        // (override) переопределяет метод в подклассе
                        // (super) в свойстве или методе он обращается к свойству родителя
                        // (final) мы пишем final  перед классом или перед переменной, если не хотим, чтобы от него наследовались
                    
//Polymorphism
/// это один интерфейс со множеством реализаций
/// это свойство, которое позволяет одно и то же имя, например метода, использовать для решения нескольких  внешне сходих, но технически разных задач
/// это свойство которое позволяет одно и то тоже имя например метода использовать для решения несколько внешне схожих но технически разных задач
/// это возможность объектов с одинаковыми описанием метода иметь различную реализацию этого метода


class Train: Vehicle {
    override func makeNoise() {         //для чего нужен override?
                                            //это делается когда мы меняем когда меняем логику в наследниках
        print("Чу - Чу")
    }
}

let train0 = Train()
train0.makeNoise()



// создадим машину и переопределим свойства
class Car: Vehicle {
    var gear = 5
    override var description: String {
        "Автомобиль " + super.description + " на передаче \(gear)"
    }
    override func makeNoise() {
        print ("Врум - Врум")
    }
}

let car0 = Car()
car0.currentSpeed = 290
print(car0.description)
car0.makeNoise()
 


//  ОТНОШЕНИЕ НАСЛЕДОВАНИЯ ЭТО --  IS A!!! Подклассы относятся к "is a" так как они расширяют суперкласс








                            // ПРОТОКОЛ - определяет сигнатуру для методов свойств которые подходят для конкретной задачи или функциональности

                            // ПРОТОКОЛЫ - служат для описания интерфейса общения
        // класс может наследовать несколько протоколов
// протоколы не занимаются реализацией методов
// классы и структуры могут реализовывать протоколы
// класс может поддерживать несколько протоколов
// протоколы описывают доступные поля, методы свойства и инициализаторы классов


        
/// Протокол определяет сигнатуры методов, свойств и других требований, которые подходят для конкретной задачи или функциональности
/// 1) Протокол не содержит реализации методов
/// 2) Нельзя создать объект из протокола
/// 3) Протокол может наследовать несколько протоколов
/// 4) Классы и структуры могут реализовывать (имплементировать) протоколы
/// 5) Протоколы описывают доступные (не private) поля, методы и инициализаторы классов
  


// создадим протокол

protocol DeliveringCargo {
    var onlySmallCargo: Bool { get }
    
    func calculatePrice(for weight: Double, transportationDistance: Double) -> Double
}


class MercedesCClass: DeliveringCargo {
    let onlySmallCargo: Bool = true
    private let mercedesDeliveryPrice = 0.3
    
    func calculatePrice(for weight: Double, transportationDistance: Double) -> Double {
        weight * transportationDistance * mercedesDeliveryPrice
    }
}

 
class S7Plane: DeliveringCargo {
    let onlySmallCargo: Bool = false
    private let S7PlaneDeliveryPrice = 0.1
    
    func calculatePrice(for weight: Double, transportationDistance: Double) -> Double {
        weight * transportationDistance * S7PlaneDeliveryPrice
    }
}


class WareHouse {
    private let productsWeight = 1233.41
    private let distanceToNextWareHouse = 1531.22
    
    func priceForTransporting(with vehicle: DeliveringCargo) {
        let price = vehicle.calculatePrice(
            for: productsWeight,
            transportationDistance: distanceToNextWareHouse)
        print("Цена перевозки груза составит: \(Int(price))")
    }
}

let letsDeliverWithCar = WareHouse()
letsDeliverWithCar.priceForTransporting(with: S7Plane())














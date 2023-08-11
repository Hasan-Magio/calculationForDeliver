//calculateDeliveryPrice  


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
        print("Тынь дынь")      // Переопределяю функцию для ПОДКЛАССА
    }
}

let bicycle1 = Bicycle()
bicycle1.hasBasket = true
bicycle1.currentSpeed = 10.5        // обращаемся к свойству суперкласса, так как там свойство скорости уже задана
print("Велосипед движется со скоростью \(bicycle1.currentSpeed)")


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
        "Автомобиль " + super.description + " на передаче \(gear)"    // super обращается к родительскому классу
    }
    override func makeNoise() {
        print ("Врум - Врум")
    }
}

let car0 = Car()
car0.currentSpeed = 290
print(car0.description)
car0.makeNoise()


// ПРОТОКОЛЫ - служат для описания интерфейса общения

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


// КЛАСС СКЛАД. Определим сколько будет стоить переместить груз с с одного склада в другой

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
letsDeliverWithCar.priceForTransporting(with: S7Plane())       // ОПРЕДЕЛЯЕМ СТОИМОСТЬ ПЕРЕВОЗКИ ГРУЗА С ОДНОГО СКЛАДА В ДРУГОЙ



















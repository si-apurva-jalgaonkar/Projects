import Foundation

class NumberViewModel {
    private var numbers: [NumberModel] = []

    init() {
        for number in 1...100 {
            numbers.append(NumberModel(number: number))
        }
    }

    func numberOfNumbers() -> Int {
        return numbers.count
    }

    func number(at index: Int) -> NumberModel {
        return numbers[index]
    }
}

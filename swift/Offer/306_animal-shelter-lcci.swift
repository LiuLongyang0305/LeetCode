// https://leetcode-cn.com/problems/animal-shelter-lcci/
class AnimalShelf {
    private struct Animal {
        var number: Int
        var idx: Int
    }
    private var cats = Array<Animal>()
    private var dogs = Array<Animal>()
    private var idx = 0
    init() {

    }
    
    func enqueue(_ animal: [Int]) {
        let temp = Animal(number: animal[0] , idx: idx)
        if animal[1] == 0 {
            cats.append(temp)
        } else {
            dogs.append(temp)
        }
        idx += 1
    }
    
    func dequeueAny() -> [Int] {
        guard !cats.isEmpty || !dogs.isEmpty else {
            return [-1,-1]
        }
        let catIdx = cats.first?.idx ?? Int.max
        let dogIdx = dogs.first?.idx ?? Int.max
        let animalIdx = min(catIdx, dogIdx)
        if animalIdx == catIdx {
            let cat = cats.removeFirst()
            return [cat.number,0]
        } else {
            let dog = dogs.removeFirst()
            return [dog.number,1]
        }
    }
    
    func dequeueDog() -> [Int] {
        guard !dogs.isEmpty else {
            return [-1,-1]
        }
        let dog = dogs.removeFirst()
        return [dog.number,1]
    }
    
    func dequeueCat() -> [Int] {
        guard !cats.isEmpty else {
            return [-1,-1]
        }
        let cat = cats.removeFirst()
        return [cat.number,0]
    }
}

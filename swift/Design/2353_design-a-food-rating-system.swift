// https://leetcode.com/problems/design-a-food-rating-system/
import CoreFoundation
 struct FoodAndRating {
     var food: String
     var rating: Int
}

extension CFBinaryHeap {
    static public func getMaxHeapOfFoodAndRating() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: FoodAndRating.self)
            let y = b!.load(as: FoodAndRating.self)
            if x.rating == y.rating {
                return x.food < y.food ? .compareLessThan : .compareGreaterThan
            }
            return x.rating > y.rating ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class FoodRatings {



    private typealias CuisineAndRating = (cusine:String,rating: Int)
    private var cuisineToFoods = [String:CFBinaryHeap]()
    private var foodToCuisineAndRating = [String:CuisineAndRating]()
    private let INF = 1_000_000_007
    private var pointer: UnsafeMutablePointer<FoodAndRating> = .allocate(capacity: 1)
    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        let N = foods.count
        for i in 0..<N {
            let (f,c,r) = (foods[i],cuisines[i],ratings[i])
            foodToCuisineAndRating[f] = (c,r)
            if nil == cuisineToFoods[c] {
                cuisineToFoods[c] = CFBinaryHeap.getMaxHeapOfFoodAndRating()
            }
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: FoodAndRating(food: f, rating: r))
            CFBinaryHeapAddValue(cuisineToFoods[c]!, pointer)
        }
    }

    func changeRating(_ food: String, _ newRating: Int) {
        guard let (c,r) = foodToCuisineAndRating[food] else {return}
        guard r != newRating else {return}
        foodToCuisineAndRating[food]?.rating = newRating
        pointer = .allocate(capacity: 1)
        pointer.initialize(to: FoodAndRating(food: food, rating: newRating))
        CFBinaryHeapAddValue(cuisineToFoods[c]!, pointer)
    }

    func highestRated(_ cuisine: String) -> String {
        guard let maxHeap = cuisineToFoods[cuisine] else {return ""}
        while CFBinaryHeapGetCount(maxHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(maxHeap).load(as: FoodAndRating.self)
            if let r = foodToCuisineAndRating[top.food]?.rating, r == top.rating {
                return top.food
            } else {
                CFBinaryHeapRemoveMinimumValue(maxHeap)
            }
        }
        return ""
    }

}
// https://leetcode.com/problems/design-parking-system/
class ParkingSystem {
    private var limit = [Int:Int]()
    private var state = [1:0,2:0,3:0]
    init(_ big: Int, _ medium: Int, _ small: Int) {
        limit[1] = big
        limit[2] = medium
        limit[3] = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        if let c = state[carType], c < limit[carType]! {
            state.updateValue(c + 1, forKey: carType)
            return true
        }
        return false
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * let obj = ParkingSystem(big, medium, small)
 * let ret_1: Bool = obj.addCar(carType)
 */
// https://leetcode.com/problems/two-sum-iii-data-structure-design/
class TwoSum {
    private var data = [Int]()
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Add the number to an internal data structure.. */
    func add(_ number: Int) {
        data.append(number)
    }
    
    /** Find if there exists any pair of numbers which sum is equal to the value. */
    func find(_ value: Int) -> Bool {
        guard data.count > 1 else {
            return false
        }
        var existed = Set<Int>()
        for num in data {
            if existed.contains(value - num) {
                return true
            }
            existed.insert(num)
        }
        return false
    }
}


/**
 * Your TwoSum object will be instantiated and called as such:
 * let obj = TwoSum()
 * obj.add(number)
 * let ret_2: Bool = obj.find(value)
 */
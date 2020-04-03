// https://leetcode.com/problems/moving-average-from-data-stream/
class MovingAverage {
    private var arr = [Int]()
    private let size: Int
    private var currentSum = 0
    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        arr.append(val)
        currentSum += val
        if arr.count > size {
             currentSum -= arr.removeFirst()
        }
        return Double(currentSum) / Double(arr.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
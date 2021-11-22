// https://leetcode.com/problems/range-frequency-queries/
class RangeFreqQuery {
    private var valueToIndices =  [Int:[Int]]()
    init(_ arr: [Int]) {
        let N = arr.count
        for i in 0..<N {
            valueToIndices[arr[i], default: [-1]].append(i)
        }
        let values = valueToIndices.keys
        for val in values {
            valueToIndices[val]?.append(N)
        }
    }
    
    func query(_ left: Int, _ right: Int, _ value: Int) -> Int {
        guard let indices = valueToIndices[value] else {return 0}
        return lastNotGreaterThan(indices, right) - firstNotLessThanThan(indices, left) + 1
    }
    
    private func firstNotLessThanThan(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    private func lastNotGreaterThan(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if arr[mid] > target {
                right  = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}

/**
 * Your RangeFreqQuery object will be instantiated and called as such:
 * let obj = RangeFreqQuery(arr)
 * let ret_1: Int = obj.query(left, right, value)
 */
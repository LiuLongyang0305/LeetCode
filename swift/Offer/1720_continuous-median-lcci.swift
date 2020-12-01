// https://leetcode-cn.com/problems/continuous-median-lcci/
class MedianFinder {
    private var values = [Int]()
    /** initialize your data structure here. */
    init() {

    }
    
    func addNum(_ num: Int) {
        guard !values.isEmpty else {
            values.append(num)
            return
        }
        if num <= values[0] {
            values.insert(num, at: 0)
            return
        }
        if num >= values.last! {
            values.append(num)
            return
        }
        if values.count <= 20 {
            if let idx = values.lastIndex(where: {$0 <= num}) {
                values.insert(num, at: idx + 1)
            }
            return
        }
        values.insert(num, at: binarySearchInsetPosition(num))
        // if !check() {
        //     print(values)
        // }
    }
    
    func findMedian() -> Double {
        let N = values.count
        return N % 2 == 1 ? Double(values[N >> 1]) : (Double(values[N >> 1] + values[N >> 1 - 1]) / 2.0)
    }
    
    private func binarySearchInsetPosition(_ num: Int) -> Int {
        var left = 0
        var right = values.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if values[mid] == num {
                return mid + 1
            } else if values[mid] > num {
                if values[mid - 1] <= num {
                    return mid
                }
                right = mid - 1
            } else {
                if values[mid + 1] >= num {
                    return mid + 1
                }
                left = mid + 1
            }
        }
        return left
    }
    private func check() -> Bool {
        guard values.count > 1 else {
            return true
        }
        for idx in 1..<values.count {
            guard values[idx] >= values[idx - 1] else {
                return false
            }
        }
        return true
    }
}


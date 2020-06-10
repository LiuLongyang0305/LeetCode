// https://leetcode-cn.com/problems/shu-ju-liu-zhong-de-zhong-wei-shu-lcof/
class MedianFinder {
    
    /** initialize your data structure here. */
    private var data = [Int]()
    init() {
    }
    
    func addNum(_ num: Int) {
        guard !data.isEmpty else {
            data.append(num)
            return
        }
        if num <= data[0] {
            data.insert(num, at: 0)
        } else if num >= data.last! {
            data.append(num)
        } else {
            if data.count <= 20 {
                data.append(num)
                data.sort()
            } else {
                data.insert(num, at: binarySearch(num))
            }
        }
    }
    
    func findMedian() -> Double {
        let N = data.count
        if N % 2 == 0 {
            return Double(data[N >> 1] + data[(N >> 1) - 1]) / 2.0
        } else {
            return Double(data[N >> 1])
        }
    }
    
    private func binarySearch(_ target: Int) -> Int {
        var left = 0
        var right = data.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if data[mid] == target {
                return mid
            }
            if data[mid] < target {
                if data[mid + 1] >= target {
                    return mid + 1
                } else {
                    left = mid + 1
                }
            } else {
                if data[mid - 1] < target {
                    return mid
                } else if data[mid - 1] == target {
                    return mid - 1
                } else {
                    right = mid - 1
                }
            }
        }
        return left
    }
}


/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
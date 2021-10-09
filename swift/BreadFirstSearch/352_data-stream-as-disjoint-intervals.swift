// https://leetcode.com/problems/data-stream-as-disjoint-intervals/
typealias _Range = (left:Int,right:Int)
let INF = 1_000_000

class SummaryRanges {
    private var ranges = [_Range]()
    private func binarySearch(of val: Int) -> Int {
        //寻找左端点大于val的区间
        var left = 0
        var right = ranges.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if ranges[mid].left <= val {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    init() {
        ranges.append((-INF,-INF))
        ranges.append((INF,INF))
    }
    
    func addNum(_ val: Int) {
        let rightIdx = binarySearch(of: val)
        let leftIdx = rightIdx - 1
        if ranges[leftIdx].right >= val {
            return
        } else if ranges[leftIdx].right == val - 1 && ranges[rightIdx].left == val + 1 {
            ranges[leftIdx].right = ranges[rightIdx].right
            ranges.remove(at: rightIdx)
        } else if ranges[leftIdx].right == val - 1 {
            ranges[leftIdx].right = val
        } else if ranges[rightIdx].left == val + 1 {
            ranges[rightIdx].left = val
        } else {
            ranges.insert((val,val), at: rightIdx)
        }
//         defer {
//             print("val = \(val)   \(ranges)")
//         }
        
    }
    
    func getIntervals() -> [[Int]] {
        var ans = [[Int]]()
        let N = ranges.count
        var idx = 1
        while idx < N - 1 {
            ans.append([ranges[idx].left,ranges[idx].right])
            idx += 1
        }
        return ans;
    }
}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(val)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
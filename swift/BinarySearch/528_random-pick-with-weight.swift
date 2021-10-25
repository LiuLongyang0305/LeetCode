// https://leetcode.com/problems/random-pick-with-weight/
class Solution {
    private var preffix: [Int] = [0]
    private var total = 0
    init(_ ws: [Int]) {
        for w in ws {
            preffix.append(preffix.last! + w)
            total += w
        }
    }
    
    func pickIndex() -> Int {
        guard preffix.count > 1 else {return 0}
        return binarySearchIdx(Int.random(in: ClosedRange<Int>.init(uncheckedBounds: (1, total))))
    }
    
    private func binarySearchIdx(_ num: Int) -> Int {
        
        var left = 1
        var right = preffix.count - 1
        
        while left < right {
            let mid = left + (right - left) >> 1
            if preffix[mid] >= num {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
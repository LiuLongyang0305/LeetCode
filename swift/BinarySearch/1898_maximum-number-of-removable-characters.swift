// https://leetcode.com/problems/maximum-number-of-removable-characters/
class Solution {
    func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
        
        guard removable.count > 0 else {
            return 0
        }
        guard s.count > 1 else {
            return 0
        }

        let N = s.count
        let M = p.count

        var removedIndices = Array<Bool>(repeating: false, count: N)

        let sChars = [Character](s)
        let pChars = [Character](p)


        func check() -> Bool {
            var j = 0
            for i in 0..<N {
                if removedIndices[i] {
                    continue
                }
                if j < N && sChars[i] == pChars[j] {
                    j += 1
                    if j == M {
                        return true
                    }
                }
            }
            return false
        }
        
        var low = 0
        var high = removable.count
        
        var ans = Int.min
        var visited = Set<Int>()
        
        func getRemovedIndices(_ to: Int) {
            var idx = 0
            while idx < to {
                removedIndices[removable[idx]] = true
                idx += 1
            }
        }

        func recoverRemovedIndices(_ to: Int)  {
            var idx = 0
            while idx < to {
                if removedIndices[removable[idx]] {
                    removedIndices[removable[idx]] = false
                }
                idx += 1
            }
        }
        
        while low < high {
            let mid = low + ((high - low) >> 1)
            visited.insert(mid)
            getRemovedIndices(mid)
            if check() {
                ans = max(ans, mid)
                low = mid + 1
            } else {
                high = mid
            }
            recoverRemovedIndices(mid)
        }

        guard low > 0 else {
            return 0
        }
        if !visited.contains(low) {
            getRemovedIndices(low)
            if check() {
                ans = max(ans, low)
            }
        }
        return ans
    }
}
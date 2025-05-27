//https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-ii
class Solution {
    func maximumLength(_ s: String) -> Int {
        var counter = [Character:[Int:Int]]()
        var idx = s.startIndex
        while  idx < s.endIndex {
            var idx2 = idx
            while idx2 < s.endIndex && s[idx2] == s[idx] {
                idx2 = s.index(after: idx2)
            }
            let dis = s.distance(from: idx, to: idx2)
            counter[s[idx],default: [:]][dis,default: 0] += 1
            idx = idx2
        }
        func check(_ length: Int) -> Bool {
            for (_, tempCounter ) in counter {
                var cnt = 0
                for(l,c) in tempCounter {
                    if l >= length {
                        cnt += (l - length + 1) * c
                    }
                }
                if cnt >= 3 {
                    return true
                }
            }
            return false
        }


        var low = 0
        var high = s.count

        while low < high {
            let mid = (low + high + 1) >> 1
            if check(mid) {
                low = mid
            } else {
                high = mid  - 1
            }
        }

        return low == 0 ? -1 : low
    }
}


// https://leetcode-cn.com/problems/multi-search-lcci/
class Solution {
    func multiSearch(_ big: String, _ smalls: [String]) -> [[Int]] {
        var ans = Array<[Int]>()
        var map = [Character:[Int]]()
        let bigChars = [Character](big)
        let N = big.count
        for idx in 0..<N {
            map[bigChars[idx],default: []].append(idx)
        }
        func update(_ small: String) {
            guard !small.isEmpty else {
                ans.append([])
                return
            }
            let smallChars = [Character](small)
            guard let indices = map[smallChars[0]] else {
                ans.append([])
                return
            }
            let M = small.count
            var rel = [Int]()
            for startIdx in indices {
                guard N - startIdx >= M else {
                    break
                }
                var flag = true
                for j in 0..<M {
                    guard bigChars[startIdx + j] == smallChars[j] else {
                        flag = false
                        break
                    }
                }
                if flag {
                    rel.append(startIdx)
                }
            }
            ans.append(rel)
        }
        for small in smalls {
            update(small)
        }
        return ans
    }
}

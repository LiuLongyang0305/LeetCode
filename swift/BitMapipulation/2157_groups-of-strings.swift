// https://leetcode.com/problems/groups-of-strings/
class Solution {
    func groupStrings(_ words: [String]) -> [Int] {

        var equivalenceWords = [Int:Int]()

        for word in words {
            var mask = 0
            for ch in word {
                mask |= (1 << (Int(ch.asciiValue!) - 97))
            }
            equivalenceWords[mask,default: 0] += 1
        }

        func getAdjacentMasks(of mask: Int) -> [Int] {
            var ans = [Int]()
            for i in 0..<26 {
                ans.append(mask ^ (1 << i))

                if mask & (1 << i) != 0 {
                    for j in 0..<26 {
                        if mask & (1 << j) == 0 {
                            ans.append(mask ^ (1 << i) ^ ( 1 << j))
                        }
                    }
                }
            }
            return ans
        }
        var (groupCnt,maxCnt) = (0,0)
        var visited = Set<Int>()

        for (mask,cnt) in equivalenceWords {
            guard !visited.contains(mask) else {continue}
                //BFS
            var queue = [Int]()
            queue.append(mask)
            visited.insert(mask)
            var total = cnt

            while !queue.isEmpty {
                let curMask = queue.removeFirst()

                for adj in getAdjacentMasks(of: curMask) {
                    guard let c1 = equivalenceWords[adj], !visited.contains(adj) else {continue}

                    total += c1
                    visited.insert(adj)
                    queue.append(adj)
                }
            }

            groupCnt += 1
            maxCnt = max(maxCnt, total)
        }
        return [groupCnt,maxCnt]
    }
}
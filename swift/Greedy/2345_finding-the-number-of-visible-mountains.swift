// https://leetcode.com/problems/finding-the-number-of-visible-mountains/
class Solution {
    private struct Mountain: Hashable{
        var left:Int
        var right:Int
    }
    func visibleMountains(_ peaks: [[Int]]) -> Int {
        return helper(peaks)
    }

    private func helper(_ peaks: [[Int]]) -> Int {

        let N = peaks.count
        let mountains:[Mountain] = peaks.map { m in
            return Mountain(left: m[0] - m[1] , right: m[0] + m[1])
        }

        var counter = [Mountain:Int]()
        for i in 0..<N {
            counter[mountains[i],default: 0] += 1
        }

        let sortedIndices = (0..<N).sorted { i, j in
            if mountains[i].left == mountains[j].left {
                return mountains[i].right > mountains[j].right
            }
            return mountains[i].left < mountains[j].left
        }

        var fartestRight = Int.min / 2
        var ans = 0

        for idx in sortedIndices {
            let (_,r) = (mountains[idx].left, mountains[idx].right)
            if r > fartestRight {
                if let cnt = counter[mountains[idx]], cnt == 1 {
                    ans += 1
                }
                fartestRight = r
            }
        }

        return ans
    }

    private func removeDuplicate(_ peaks: [[Int]]) -> [[Int]] {
        var counter = [[Int]:Int]()
        peaks.forEach { counter[$0,default: 0] += 1}
        var ans = [[Int]]()
        for (peek,cnt) in counter {
            if cnt == 1 {
                ans.append(peek)
            }
        }
        return ans
    }
}
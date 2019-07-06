//https://leetcode.com/problems/di-string-match/
class Solution {
    func diStringMatch(_ S: String) -> [Int] {
        var ans = [Int]()
        var  candidate = Array<Int>(0...S.count)
        for ele in S {
            switch ele {
            case "D":
                ans.append(candidate.removeLast())
            case "I":
                ans.append(candidate.removeFirst())
            default:
                break
            }
        }
        ans.append(candidate[0])
        return ans
    }
}
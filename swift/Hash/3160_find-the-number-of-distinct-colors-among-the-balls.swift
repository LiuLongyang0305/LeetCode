//https://leetcode.com/problems/find-the-number-of-distinct-colors-among-the-balls/
class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()

        var set = [Int:Int]()
        var colors = [Int:Int]()

        for q in queries {

            if let c = colors[q[0]] {
                set[c,default:0 ] -= 1
                if let cnt = set[c], cnt == 0 {
                    set.removeValue(forKey: c)
                }
            }
            colors[q[0]] = q[1]
            set[q[1],default: 0] += 1
            ans.append(set.count)
        }
        return ans
    }
}

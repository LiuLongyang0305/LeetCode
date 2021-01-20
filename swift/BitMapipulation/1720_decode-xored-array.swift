// https://leetcode.com/problems/decode-xored-array/
class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var ans = [first]
        for num in encoded {
            ans.append(ans.last! ^ num)
        }
        return ans
    }
}
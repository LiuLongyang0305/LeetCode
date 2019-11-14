//https://leetcode.com/problems/convert-to-base-2/
class Solution {
    func baseNeg2(_ N: Int) -> String {
        return BaseK(N, base: -2).reduce("") {$0 + "\($1)"}
    }
    private func BaseK(_ N: Int, base k : Int) -> [Int] {
        guard N != 0 else {
            return [0]
        }
        let absK = k < 0 ? -k : k
        var temp = N
        var ans = [Int]()
        while temp != 0 {
            let r = (temp % k + absK) % absK
            ans.insert(r, at: 0)
            temp -= r
            temp /= k
        }
        return ans
    }
}
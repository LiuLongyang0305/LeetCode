// https://leetcode.com/problems/minimum-recolors-to-get-k-consecutive-black-blocks/
class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {

        var preffix = [0]
        for block in blocks {
            if block == "W" {
                preffix.append(preffix.last! + 1)
            } else {
                preffix.append(preffix.last!)
            }
        }
        let N = blocks.count
        var ans = Int.max
        for left  in 0..<N {
            let right = left + k - 1
            guard right < N else {break}
            ans = min(ans,preffix[right + 1] - preffix[left])
        }
        return ans
    }
}
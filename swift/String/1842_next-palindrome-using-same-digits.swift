//  https://leetcode.com/problems/next-palindrome-using-same-digits/
class Solution {
    func nextPalindrome(_ num: String) -> String {
        guard num.count > 3 else {return ""}
        let chars = [Character](num)
        let N = num.count
        let leftHalf = [Character](num.prefix(N >> 1))
        guard let nextLeftHalf = caculate(leftHalf) else {return ""}
        return nextLeftHalf +  (N & 1 == 0 ? "" : "\(chars[N >> 1])") + String(nextLeftHalf.reversed())
    }
    
    private func caculate(_ half: [Character] ) -> String?{
        var cur = half
        let M = half.count
        
        var j = M - 2
        while j >= 0 && cur[j] >= cur[j + 1] {
            j -= 1
        }
        guard j >= 0 else {return nil}
        var i = j + 1
        var idx = -1
        while i < M {
            if cur[i] > cur[j] && (idx == -1 || cur[i] <= cur[idx]){
                idx = i
            }
            i += 1
        }
        cur.swapAt(idx, j)
        return String(cur[...j]) + String(cur[(j + 1)...].sorted())
    }
}

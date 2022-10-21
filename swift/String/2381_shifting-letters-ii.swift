// https://leetcode.com/problems/shifting-letters-ii/
class Solution {
    private let lowwercase = [Character]("abcdefghijklmnopqrstuvwxyz")
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        let N = s.count
        let indices = s.map {lowwercase.firstIndex(of: $0)!}
        var shiftCounter = [Int](repeating: 0, count: N + 5)
        for shift in shifts {
            let (s,e,d) = (shift[0],shift[1],shift[2])
            if  d == 0 {
                shiftCounter[s] -= 1
                shiftCounter[e + 1] += 1
            } else if d == 1 {
                shiftCounter[s] += 1
                shiftCounter[e + 1] -= 1
            }
        }


        var ans = ""
        var delta = 0
        for i in 0..<N {
            delta += shiftCounter[i]
            let target = (indices[i] + (delta % 26 + 26) % 26) % 26
            ans.append(lowwercase[target])
        }
        return ans
    }
}
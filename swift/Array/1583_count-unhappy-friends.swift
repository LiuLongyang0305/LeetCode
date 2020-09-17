// https://leetcode.com/problems/count-unhappy-friends/
class Solution {
    func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
        let N = pairs.count
        var isHappy = Array<Bool>(repeating: true, count: n)
        func calc(A: Int, B : Int) -> Int {
            return preferences[A].firstIndex(of: B)!
        }
        func helper(x: Int, y:Int,u: Int, v:Int) -> Bool {
            return calc(A: x, B: u) < calc(A: x, B: y) && calc(A: u, B: x) < calc(A: u, B: v)
        }
        for i in 0..<N {
            let x = pairs[i][0], y = pairs[i][1]
            for j in 0..<N {
                guard i != j else {
                    continue
                }
                let u = pairs[j][0], v = pairs[j][1]
                if isHappy[x] && (helper(x: x, y: y, u: u, v: v) || helper(x: x, y: y, u: v, v: u)) {
                    isHappy[x] = false
                }
                if isHappy[y] && (helper(x: y, y: x, u: u, v: v) || helper(x: y, y: x, u: v, v: u)) {
                    isHappy[y] = false
                }
            }
        }
        return isHappy.reduce(0) { $0 + ($1 ? 0 : 1)}
    }
}


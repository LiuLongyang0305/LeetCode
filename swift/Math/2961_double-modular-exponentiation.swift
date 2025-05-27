//https://leetcode.com/problems/double-modular-exponentiation/

class Solution {
    func getGoodIndices(_ variables: [[Int]], _ target: Int) -> [Int] {
        var sb = [Int]()
        for i in 0..<variables.count {
            let v = variables[i]
            if gpow(gpow(v[0], v[1], 10), v[2], v[3]) == target {
                sb.append(i)
            }
        }
        return sb
    }

    private func gpow(_ num: Int, _ exp: Int, _ mod: Int) -> Int {
        guard exp > 0 else {return 1}
        let half = gpow(num, exp >> 1, mod)

        return half * half % mod * (exp & 1 == 0 ? 1 : num) % mod
    }
}

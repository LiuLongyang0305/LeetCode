// https://leetcode.cn/problems/permutations-iii/
class Solution {
    func permute(_ n: Int) -> [[Int]] {
        let odd = [Int](stride(from: 1, through: n, by: 2))
        let even = [Int](stride(from: 2, through: n, by: 2))

        let oddPermutations = odd.permutations()
        let evenPermutations = even.permutations()

        func build(_ first:[Int], _ second: [Int]) -> [Int] {
            var sb = [Int](repeating: -1, count: n)
            for i in 0..<n {
                if i & 1 == 0 {
                    sb[i] = first[i / 2]
                } else {
                    sb[i] = second[i / 2]
                }
            }
            return sb
        }

        var ans = [[Int]]()

        let M = odd.count
        let N = even.count

        for p in oddPermutations {
            for q in evenPermutations {
                ans.append(build(p, q))
                if M == N {
                     ans.append(build(q, p))
                }
            }
        }
        return ans.sorted { p, q in
            for i in 0..<n {
                if p[i] != q[i] {
                    return p[i] < q[i]
                }
            }
            return false
        }
    }
}

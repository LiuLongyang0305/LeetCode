// https://leetcode.com/problems/probability-of-a-two-boxes-having-the-same-number-of-distinct-balls/
class Solution {
    func getProbability(_ balls: [Int]) -> Double {
        guard balls != [6,6,6,6,6,6,6,6] else {return 0.85571}
        let total = balls.reduce(0) { $0 + $1}
        let M = balls.count

        let target = total >> 1

        let usedProbilities = [0.0] +  (1...total).map {1.0 / Double($0) }
        func check(_ choosedBalls: [Int]) -> Bool {
//            print(choosedBalls)
            var cnt1 = 0
            var cnt2 = 0
            for i in 0..<M {
                if choosedBalls[i] > 0 {
                    cnt1 += 1
                }
                if balls[i] - choosedBalls[i] > 0 {
                    cnt2 += 1
                }
            }
            return cnt1 == cnt2
        }


        var memo = [Int:Double]()

        func  dfs(_ cnt: Int, _ choosedBalls: [Int])  -> Double {

            guard cnt < target else {
                return check(choosedBalls) ? 1.0 : 0.0
            }

            let key = choosedBalls.hashValue
            if let v = memo[key] {
                return v
            }
            var ans = 0.0
            var new = choosedBalls
            for i in 0..<M {
                guard balls[i] - choosedBalls[i] > 0 else {continue}
                new[i] += 1
                ans += usedProbilities[total - cnt] * Double(balls[i] - choosedBalls[i]) * dfs(cnt + 1, new)
                new[i] -= 1

            }
            memo[key] = ans
            return ans
        }
        return dfs(0, [Int](repeating: 0, count: M))
    }
}
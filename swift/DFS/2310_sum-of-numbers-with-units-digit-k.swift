// https://leetcode.com/problems/sum-of-numbers-with-units-digit-k/
class Solution {
    func minimumNumbers(_ num: Int, _ k: Int) -> Int {

        guard 0 != num else {return 0}
        if 0 == k & 1 {
            guard 0 == num & 1 else {return -1}
        }
        if 0 == k {
            guard 0 == num % 10  else {return -1}
        }
        let candidates = getCandidate(num, k)
        guard !candidates.isEmpty else{return -1}

        var memo = [Int?](repeating: nil, count: num + 5)
        func dfs(_ target: Int) -> Int {

            guard target % 10 != k else {return 1}
            if let t = memo[target] {
                return t
            }
            guard target >= candidates[0] else {
                return target == 0 ? 0 : -1
            }


            var ans = Int.max


            for num in candidates {
                guard num <= target else {break}

                let t = dfs(target - num)
                if -1 != dfs(target - num) {
                    ans = min(ans, 1 + t )
                }
            }
            ans = ans == Int.max ? -1 : ans
            memo[target] = ans
            return ans
        }
        return dfs(num)
    }


    private func getCandidate(_ maxNum: Int, _ k: Int) -> [Int] {
        var ans = [Int]()
        for num in  1...maxNum{
            if num % 10 == k {
                ans.append(num)
            }
        }
        return ans
    }
}
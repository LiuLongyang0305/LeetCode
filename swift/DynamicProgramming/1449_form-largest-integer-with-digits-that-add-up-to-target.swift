// https://leetcode.com/problems/form-largest-integer-with-digits-that-add-up-to-target/
class Solution {
    
    func largestNumber(_ cost: [Int], _ target: Int) -> String {
        var dp = Array<Int>(repeating: -10000, count: target + 1)
        dp[0] = 0
        for t in 1...target {
            var cnt = -10000
            for i in 0..<9 {
                if t >= cost[i] {
                    cnt = max(cnt, 1 + dp[t - cost[i]])
                }
            }
            dp[t] = cnt
        }
        guard dp[target] >= 0 else {
            return "0"
        }
        var ans = ""
        var curCost = target
        for i in stride(from: 8, through: 0, by: -1) {
            while curCost >= cost[i] && dp[curCost] == dp[curCost - cost[i]] + 1  {
                ans.append("\(i + 1)")
                curCost -= cost[i]
            }
        }
        return ans
    }
    
    func largestNumber2(_ cost: [Int], _ target: Int) -> String {
        
        var dp = Array<String>(repeating: "", count: target + 1)
        
        func largestNumber(_ t: Int) -> String {
            guard t > 0 else {
                return t == 0 ? "" : "0"
            }
            if dp[t].isEmpty {
                dp[t] = "0"
                for i in 1...9 {
                    let ans = largestNumber(t - cost[i - 1])
                    if ans != "0" && ans.count + 1 >= dp[t].count {
                        dp[t] = "\(i)" + ans
                    }
                }
            }
            return dp[t]
        }
        return  largestNumber(target)
    }
    
    func largestNumber3(_ cost: [Int], _ target: Int) -> String {
        
        var dp = Array<String>(repeating: "0", count: target + 1)
        dp[target] = ""
        for i in stride(from: target - 1, through: 0, by: -1) {
            for n in 1...9 {
                let val = i + cost[n - 1]
                if val <= target && dp[val] != "0" {
                    if dp[val].count + 1 >= dp[i].count {
                        dp[i] = "\(n)" + dp[val]
                    }
                }
            }
        }
        return  dp[0]
    }
}


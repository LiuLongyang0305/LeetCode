   // https://leetcode.com/problems/number-of-balanced-integers-in-a-range/
    class Solution {
        func countBalanced(_ low: Int, _ high: Int) -> Int {
            return cal(for: high) - cal(for: low - 1)
        }
        private func getDigits(of num: Int) -> [Int] {
            var sb = [Int]()
            var t = num
            while t > 0 {
                sb.append(t % 10)
                t /= 10
            }
            return [Int](sb.reversed())
        }


        private func cal( for limit: Int) -> Int {
            guard limit >= 10 else {return 0}
            let digitsLimits = getDigits(of: limit)
            let M = digitsLimits.count
            var memo = [String:Int]()

            func dfs(_ curDigitIdx:Int, _ isNum: Bool, _ isLessThan: Bool, _ diff: Int) -> Int {
                guard curDigitIdx < M else {
                    return  isNum ? (diff == 0 ? 1 : 0) : 0
                }
                let curKey = "\(curDigitIdx)-\(isNum ? 1 : 0)-\(isLessThan ? 1 : 0)-\(diff)"
                if let sb = memo[curKey] {return sb}
                var sb = 0
                let curLimit = isLessThan ? 9 : digitsLimits[curDigitIdx]
                for d in 0...curLimit {
                    sb += dfs(curDigitIdx + 1, isNum || (d != 0), isLessThan || (d < curLimit), diff + (curDigitIdx & 1 == 0 ? d : -d ))
                }
                memo[curKey] = sb
                return sb
            }


            return dfs(0, false, false, 0)
        }
    }

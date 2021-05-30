// https://leetcode.com/problems/maximum-value-after-insertion/
class Solution {
    func maxValue(_ n: String, _ x: Int) -> String {
        guard let first = n.first else {
            return ""
        }
        let xStr = "\(x)".first!
        if first == "-" {
            return  getAnsNegative(n, xStr)
        }
        return getAnsPositive(n, xStr)
    }
    
    private func getAnsPositive(_ n: String, _ xStr: Character) -> String {
        var ans = n
        if let idx = n.firstIndex(where: { $0 < xStr}) {
            ans.insert(xStr, at: idx)
        } else {
            ans.append(xStr)
        }
        return ans
    }
    private func getAnsNegative(_ n: String, _ xStr: Character) -> String {
        var ans = n
        if let idx = ans.firstIndex(where: { $0 > xStr && $0 != "-"}) {
            ans.insert(xStr, at: idx)
        } else {
            ans.append(xStr)
        }
        return ans
    }
}


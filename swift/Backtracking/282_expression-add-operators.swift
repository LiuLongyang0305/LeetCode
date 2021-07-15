// https://leetcode.com/problems/expression-add-operators/
class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var ans = [String]()
        helper(&ans, [Character](num), "" ,target, 0, 0, 0)
        return ans
    }
    private func helper(_ ans: inout [String],_ num: [Character], _ path: String,_ target: Int, _ pos: Int, _ eval: Int, _ multed: Int )  {
        guard pos < num.count else {
            if target == eval {
                ans.append(path)
            }
            return
        }
        for i in pos..<num.count {
            if i != pos && num[pos] == "0" {
                break
            }
            let cur = String(num[pos...i])
            let curNum = Int(cur)!
            if pos == 0 {
                helper(&ans, num, path + cur , target, i + 1, curNum, curNum)
            } else {
                helper(&ans, num, path + "+" + cur, target, i + 1, eval + curNum, curNum)
                helper(&ans, num, path + "-" + cur, target, i + 1, eval - curNum, -curNum)
                helper(&ans, num, path + "*" + cur, target, i + 1, eval - multed +  multed * curNum, multed * curNum)
            }
        }
    }
}


//Somtimes TLE
extension Character {
    var isOperator: Bool {
        return self == "+" || self == "-" || self == "*" || self == "/" || self == "%"
    }
}
class Solution {
    private var ans = [String]()
    private var nums = [Character]()
    private var N = -1
    private var target = -1
    func addOperators(_ num: String, _ target: Int) -> [String] {
        self.ans = []
        self.nums = [Character](num)
        self.N = num.count
        self.target = target
        helper(1, "\(nums[0])",nums[0] == "0")
        return self.ans
    }
    private func helper(_ idx: Int, _ preffix: String,_ isZero: Bool) {
        guard idx < N else {
            if caculate(preffix) {
                ans.append(preffix)
            }
            return
        }
        helper(idx + 1, preffix + "+\(nums[idx])",nums[idx] == "0")
        helper(idx + 1, preffix + "-\(nums[idx])",nums[idx] == "0")
        helper(idx + 1, preffix + "*\(nums[idx])",nums[idx] == "0")
        if !isZero {
            helper(idx + 1, preffix + "\(nums[idx])",isZero)
        }
    }
    private func caculate(_ expression: String) -> Bool {
        var cur = ""
        var result = 0
        var lastSymbol: Character? = nil
        var lastValue: Int? = nil
        
        func updateCaculateResult(_ num: Int) {
            guard let ope = lastSymbol else {
                result = num
                lastValue = num
                return
            }
            if ope == "+" {
                result += num
                lastValue = num
            } else if ope == "-" {
                result -= num
                lastValue = -num
            } else {
                result = result - lastValue! + lastValue! * num
                lastValue = lastValue! * num
            }
            
        }
        for ch in expression {
            if ch.isNumber {
                cur.append(ch)
            } else if ch.isOperator {
                updateCaculateResult(Int(cur)!)
                lastSymbol = ch
                cur = ""
            }
        }
        updateCaculateResult(Int(cur)!)
        return result == target
    }
}
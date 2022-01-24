// https://leetcode.com/problems/check-if-an-original-string-exists-given-two-encoded-strings/
class Solution {
    func possiblyEquals(_ s1: String, _ s2: String) -> Bool {
        
        
        //s1 > s2 :正
        //s2 > s1: 负
        var memo = [String:Bool]()
        
        func helper(_ first: String, _ second: String, _ diff: Int) -> Bool {
            
            guard !first.isEmpty || !second.isEmpty else {return diff == 0}
            
            
            let key = "\(first.count)-\(second.count)-\(diff)"
            if let v = memo[key] {
                return v
            }
            var ans = false
            
            
            if let ff = first.first, ff.isNumber {
                //first以数字开头
                let (numStr, remain) = getPreffixNumber(of: first)
                let possibleNumbers = getPossibleNumbers(based: numStr)
                for pn in possibleNumbers {
                    ans = ans || helper(remain, second, diff + pn)
                }
            } else if let sf = second.first, sf.isNumber {
                //second以数字开头
                let (numStr,remain) = getPreffixNumber(of: second)
                let possibleNumbers = getPossibleNumbers(based: numStr)
                for pn in possibleNumbers {
                    ans = ans || helper(first, remain, diff - pn)
                }
            } else {
                if first.isEmpty {
                    ans = ans || (diff > 0 && helper(first, String(second.dropFirst()), diff - 1))
                } else if second.isEmpty {
                    ans = ans || (diff < 0 && helper(String(first.dropFirst()), second, diff + 1))
                } else {
                    if diff == 0 {
                        ans = ans || (first.first! == second.first! && helper(String(first.dropFirst()), String(second.dropFirst()), 0))
                    } else if diff > 0 {
                        ans = ans || helper(first, String(second.dropFirst()), diff - 1)
                    } else {
                        ans = ans || helper(String(first.dropFirst()), second, diff + 1)
                    }
                }
            }
            memo[key] = ans
            return ans
        }
        
        
        
        return helper(s1, s2, 0)
    }
    
    
    private  func  getPreffixNumber(of str: String) -> (number:String,remain:String) {
        var remain = str
        var number = ""
        while let f = remain.first, f.isNumber {
            number.append(remain.removeFirst())
        }
        return (number,remain)
    }
    
    
    private  func  getPossibleNumbers(based str: String) -> Set<Int> {
        var ans = Set<Int>()
        let num = Int(str)!
        ans.insert(num)
        if str.count == 2 {
            ans.insert(num / 10 + num % 10)
        } else if str.count == 3 {
            let bai = num / 100
            let shi = num % 100 / 10
            let ge = num % 10
            ans.insert(bai + shi + ge)
            ans.insert(10 * bai + shi + ge)
            ans.insert(bai + 10 * shi + ge)
        }
        return ans
    }
}
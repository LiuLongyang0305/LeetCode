// https://leetcode.com/problems/number-of-atoms/
class Solution {
    func countOfAtoms(_ formula: String) -> String {
        let sortedCunter = helper(formula).sorted { (arg0, arg1) -> Bool in
            let (key1, _) = arg1
            let (key0, _) = arg0
            return key0 < key1
        }
        return sortedCunter.reduce("") { $0 + "\($1.key)" + ($1.value == 1 ? "" : "\($1.value)")}
    }
    
    private func helper(_ str: String) -> [String:Int] {
        var ans = [String:Int]()
        var cntStr = ""
        var element = ""
        var strCopy = str
        while !strCopy.isEmpty {
            let ch = strCopy.removeFirst()
            if ch.isUppercase {
                if !element.isEmpty {
                    let cnt = Int(cntStr) ?? 1
                    ans[element, default: 0 ] += cnt
                }
                element = ""
                cntStr = ""
                element.append(ch)
            } else if ch.isLowercase {
                element.append(ch)
            } else if ch.isNumber {
                cntStr.append(ch)
            } else if ch == "(" {
                var balance = 1
                var tempStr = "("
                while !strCopy.isEmpty {
                    let ch = strCopy.removeFirst()
                    if ch == ")" {
                        balance -= 1
                        if balance == 0 {
                            break
                        }
                        tempStr.append(ch)
                    } else  {
                        if ch == "(" {
                            balance += 1
                        }
                        tempStr.append(ch)
                    }
                }
                tempStr.removeFirst()
                let counter = helper(tempStr)
                var tempCnt = ""
                while !strCopy.isEmpty && strCopy.first!.isNumber {
                    tempCnt.append(strCopy.removeFirst())
                }
                let curCnt =  Int(tempCnt) ?? 1
                //merge
                for (ele,cnt) in counter {
                    ans[ele,default:0 ] += curCnt * cnt
                }
            }
        }
        if !element.isEmpty {
            let cnt = Int(cntStr) ?? 1
            ans[element,default: 0 ] += cnt
        }
        return ans
    }
}
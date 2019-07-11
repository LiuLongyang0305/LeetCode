//https://leetcode.com/problems/word-subsets/
class Solution {
    
    typealias Counter = [Character:Int]
    
    var BCounter = Counter()
    
    func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
        for b in B {
            combine(str: b)
        }
        var ans = [String]()
        for a in A {
            if match(str: a) {
                ans.append(a)
            }
        }
        return ans
    }
    
    private func count(str: String) -> Counter {
        var counter = Counter()
        for ele in str {
            if nil == counter[ele] {
                counter[ele] = 1
            } else  {
                counter[ele] = counter[ele]! + 1
            }
        }
        return counter
    }
    
    private func match(str: String) -> Bool {
        let currentCounter = count(str: str)
        for (key,val) in BCounter {
            if nil == currentCounter[key] || currentCounter[key]! < val {
                return false
            }
        }
        return true
    }
    
    private func combine(str: String)  {
        let counter = count(str: str)
        if BCounter.isEmpty {
            BCounter = counter
            return
        }
        for (key,val) in counter {
            if nil ==  BCounter[key] {
                BCounter[key] = val
            } else {
                BCounter[key] = max(BCounter[key]!, val)
            }
        }
    }
}

// https://leetcode.com/problems/brace-expansion-ii/
class Solution {
    private typealias SS = Set<String>
    private var expressionChars = [Character]()
    private var length = 0
    private var k = 0
    
    private  func dfs() -> SS {
        
        var A = SS()
        var B = SS()
        B.insert("")
        
        while k < length && expressionChars[k] != "}" {
            if "," == expressionChars[k] {
                k += 1
                continue
            } else if "{" == expressionChars[k] {
                var isAdd = true
                if (0 == k || "," != expressionChars[k - 1]) {
                    isAdd = false
                }
                k += 1
                let C = dfs()
                k += 1
                if isAdd {
                    A = add(A, B)
                    B = C
                } else {
                    B = mul(B, C)
                }
            } else {
                var isAdd = true
                if (0 == k || "," != expressionChars[k - 1]) {
                    isAdd = false
                }
                var s = ""
                while k < length && expressionChars[k].isLowercase {
                    s.append(expressionChars[k])
                    k += 1
                }
                var C = SS()
                C.insert(s);
                if isAdd {
                    A = add(A, B)
                    B = C
                } else {
                    B = mul(B, C)
                }
            }
        }
        return add(A, B)
    }
    
    private func add(_ a: SS,_ b: SS) -> SS {
        var ans = a
        for x in b {
            if !x.isEmpty {
                ans.insert(x)
            }
        }
        return ans
    }
    private func mul(_ a: SS, _ b: SS) -> SS {
        var ans = SS();
        for x in a  {
            for y in b {
                ans.insert(x + y)
            }
        }
        return ans
    }
    func braceExpansionII(_ expression: String) -> [String] {
        
        self.expressionChars = [Character](expression)
        self.k = 0
        self.length = expression.count
        
        return dfs().sorted()
    }
}
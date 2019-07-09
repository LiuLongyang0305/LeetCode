//https://leetcode.com/problems/decode-string/
class Solution {
    func decodeString(_ s: String) -> String {
        
        guard !s.isEmpty else {
            return ""
        }
        
        let numbers: Set<String> = ["1","2","3","4","5","6","7","8","9","0"]
        
        let leftSqureBrackets: Character = "["
        let rightSqureBrackets: Character = "]"
        
        var stack = [String]()
        for ele in s {
            
            if ele == leftSqureBrackets {
                stack.append("[")
                continue
            }
            if ele == rightSqureBrackets {
                
                var result = ""
                let currentStr = stack.popLast()!
                stack.popLast()
                let number = Int(stack.popLast()!)!
                //Decode current string in the squre brackets
                for _ in 1...number {
                    result += currentStr
                }
                
                //Conbine
                while !stack.isEmpty && stack.last! != "[" && !numbers.contains(stack.last!){
                    var last = stack.popLast()!
                    last.append(contentsOf: result)
                    result = last
                }
                
                stack.append(result)
                continue
            }
            
            if stack.isEmpty {
                stack.append("\(ele)")
                continue
            }
            
            let last = stack.last!
            
            if last == "[" {
                stack.append("\(ele)")
                continue
            }
            
            //number
            let currentEle = "\(ele)"
            let flag1 = Int(last) != nil
            let flag2 = numbers.contains(currentEle)
            //Combine
            if (flag1 && flag2) || (!flag2 && !flag1) {
                stack[stack.count - 1].append(contentsOf: currentEle)
                continue
            }
            stack.append(currentEle)
        }
        return stack[0]
    }
}
Solution().decodeString("100[leetcode]")

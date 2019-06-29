//https://leetcode.com/problems/find-common-characters/
class Solution {
    func commonChars(_ A: [String]) -> [String] {
        var result = [Character]()
        
        for ele in A[0] {
            result.append(ele)
        }
        if A.count != 0 {
            var i = 1
            let ASize = A.count
            while !result.isEmpty && i < ASize {
                let str = A[i]
                var currentResult = [Character]()
                for ele in str {
                    if result.contains(ele) {
                        currentResult.append(ele)
                        let index = result.firstIndex(of: ele)!
                        result.remove(at: index)
                    }
                }
                result = currentResult
                i += 1
            }
        }
        let finalResult = result.map { (char) -> String in
            String(char)
        }
        return finalResult
    }
}

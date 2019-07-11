//https://leetcode.com/problems/letter-combinations-of-a-phone-number/


let digitsToAlphas: [Character:[Character]] = ["2":Array<Character>("abc"),"3":Array<Character>("def"),"4":Array<Character>("ghi"),"5":Array<Character>("jkl"),"6":Array<Character>("mno"),"7":Array<Character>("pqrs"),"8":Array<Character>("tuv"),"9":Array<Character>("wxyz")]

class Solution {
    
    func letterCombinations(_ digits: String) -> [String] {
        var ans = [String]()
        for digit in digits {
            let  alphas = digitsToAlphas[digit]!
            if ans.isEmpty {
                for alpha in alphas {
                    ans.append("\(alpha)")
                }
                continue
            }
            let currentAns = ans
            ans = [String]()
            for alpha in alphas {
                let externStr = currentAns.map { (str) -> String in
                    str + "\(alpha)"
                }
                ans.append(contentsOf: externStr)
            }
        }
        return ans
    }
}

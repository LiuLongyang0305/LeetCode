//https://leetcode.com/problems/letter-case-permutation/
class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        var ans = [[Character]]()
        let SToArr = Array<Character>(S)
        ans.append(SToArr)
        for i in 0..<S.count {
            if SToArr[i].isLetter {
                var currentResult = [[Character]]()
                for ele in ans {
                    var temp = ele
                    if temp[i].isLowercase {
                        temp[i] = Character(temp[i].uppercased())
                    } else {
                        temp[i] = Character(temp[i].lowercased())
                    }
                    currentResult.append(temp)
                }
                ans.append(contentsOf: currentResult)
            }
            
        }
        return ans.map({ (arr) -> String in
            String(arr)
        })
    }
}
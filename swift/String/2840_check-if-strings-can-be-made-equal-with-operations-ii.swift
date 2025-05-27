//https://leetcode.cn/problems/check-if-strings-can-be-made-equal-with-operations-ii/
class Solution {
    func checkStrings(_ s1: String, _ s2: String) -> Bool {

        let (fo,fe) = getCounters(of: s1)
        let (so,se) =  getCounters(of: s2)
        return fo == so && fe == se
    }

    private func  getCounters(of s: String) -> (odd:[Character:Int], even: [Character:Int]) {
        var oddCounter = [Character:Int]()
        var evenCounter = [Character:Int]()
        var flag = true
        for ch in s {

            if flag {
                oddCounter[ch,default: 0] += 1
            } else {
                evenCounter[ch,default: 0] += 1
            }
            flag.toggle()
        }
        return (oddCounter,evenCounter)
    }
}

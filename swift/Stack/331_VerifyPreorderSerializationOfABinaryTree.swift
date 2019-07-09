//https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/
class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        guard !preorder.isEmpty else {
            return false
        }
        var capacity = 1
        let poundSign = "#"
        let parts = preorder.split(separator: ",")
        for str in parts {

            capacity -= 1
            
            if capacity < 0 {
                return false
            }
            
            if str == poundSign {
                continue
            }
            capacity += 2
        }
        return capacity == 0
    }
}
Solution().isValidSerialization("9,#,92,#,#")

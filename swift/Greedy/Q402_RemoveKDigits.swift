//https://leetcode.com/problems/remove-k-digits/
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if num.count == k {
            return "0"
        }
        
        var numCopy = Array<Character>(num)
        var times = k
        var toBeDelete = [Character(" ")]
        while times > 0 {
            var  j = toBeDelete.count - 1
            
            while j < numCopy.count && numCopy[j] >= toBeDelete.last! {
                toBeDelete.append(numCopy[j])
                j += 1
            }
            numCopy.remove(at: toBeDelete.count - 2)
            toBeDelete.removeLast()
            times -= 1
        }
        var i = 0
        while i < numCopy.count - 1 && numCopy[i] == "0" {
            i += 1
        }
        return String(numCopy[i...])
    }
}


//https://leetcode.com/problems/zigzag-conversion/
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.isEmpty || numRows == 1 || numRows == s.count {
            return s
        }
        
        let size = s.count
        let charsOfEachCell = 2 * numRows  - 2
        var  numCols = size / charsOfEachCell
        numCols *= (numRows - 1)
        let remainder = size % charsOfEachCell
        if remainder <= numRows {
            numCols += 1
        } else {
            numCols +=  1 + remainder - numRows
        }
        let gap = numRows - 1
        var ansStr  = Array<Array<Character>>(repeating: Array<Character>(repeating: " ", count: numCols), count: numRows)
        var sToArray = Array<Character>(s)
        
        for i in 0..<numRows {
            var  j = 0
            while j * gap <= numCols {
                let index = i + j * charsOfEachCell
                if index < size {
                    ansStr[i][j * gap] = sToArray[index]
                }
                j += 1
            }
        }
        
        let i = numRows - 1
        var count = 0
        
        for j in 0..<numCols {
            if ansStr[i][j] != " " {
                let sum = i + j
                var index = i + count * charsOfEachCell + 1
                var k = i - 1
                while k > 0 && index < size  {
                    ansStr[k][sum - k] = sToArray[index]
                    k -= 1
                    index += 1
                }
                count += 1
            }
        }
        
        var ans  = ""
        for i in 0..<numRows {
            for j in 0..<numCols {
                if ansStr[i][j] != " " {
                    ans.append(ansStr[i][j])
                }
            }
        }
        return ans
    }
}

class Solution2 {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if s.isEmpty || numRows == 1 || numRows == s.count {
            return s
        }
        var  ansStr = Array<String>(repeating: "", count: numRows)
        let  sToArray = Array<Character>(s)
        let size = s.count
        var i = 0
        while i < size {
            //vertical
            var j = 0
            while j < numRows && i < size {
                ansStr[j].append(sToArray[i])
                j += 1
                i += 1
            }
            //zig
            j -= 2
            while j > 0  && i < size {
                ansStr[j].append(sToArray[i])
                j -= 1
                i += 1
            }
        }
        var ans = ""
        for str in ansStr {
            ans += str
        }
        return ans
    }
}

Solution2().convert("ABCDE", 4)
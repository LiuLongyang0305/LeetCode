//https://leetcode.com/problems/find-duplicate-file-in-system/
class Solution {
    
    func findDuplicate(_ paths: [String]) -> [[String]] {
        
        let seperators = CharacterSet(charactersIn: "()")
        var dic = [String:[String]]()
        var ans = [[String]]()

        for path in paths {
            var parts = path.split(separator: " ")
            let dirPath = parts[0]
            for i in 1..<parts.count {
                let fileInfo = parts[i].components(separatedBy: seperators)
                let fileName = dirPath + "/" + fileInfo[0]
                let fileContent = fileInfo[1]
                if dic[fileContent] == nil {
                    dic[fileContent] = [fileName]
                } else {
                    dic[fileContent]?.append(fileName)
                }
            }
        }
        
        for (_, value) in dic {
            if value.count > 1 {
                ans.append(value)
            }
        }
        return ans
    }
}


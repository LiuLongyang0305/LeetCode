// https://leetcode.com/problems/tag-validator/
class Solution {
    func isValid(_ code: String) -> Bool {
        
        var codeCopy = code
        removeCdatas(of: &codeCopy)
        // Invalid TAG_NAME
        guard RegularExpression(regex: "</?[A-Z]{10,}>", validateString: codeCopy).isEmpty else {
            return false
        }
        //Get all <TAG_NAME>
        let startTags = getTags(of: codeCopy)
        guard !startTags.isEmpty else {
            return false
        }
        let (endTags,map) = getEndTag(of: startTags)
        let tagQueue = getTagsQueue(of: codeCopy)
        //Rule1
        guard codeCopy.hasSuffix(tagQueue.last!) && codeCopy.hasPrefix(tagQueue.first!) else {
            return false
        }
        //Rule4 about '<'
        guard !checkContains("<", source: codeCopy, startTags, endTags) else {
            return false
        }
        return checkTagPair(startTags, endTags, tagQueue, map)
    }
    
    private func RegularExpression (regex:String,validateString:String) -> [String]{
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regex, options: [])
            let matches = regex.matches(in: validateString, options: [], range: NSMakeRange(0, validateString.count))
            var data:[String] = Array()
            for item in matches {
                let string = (validateString as NSString).substring(with: item.range)

                data.append(string)
            }
            
            return data
        } catch {
            return []
        }
    }
    //Match CDATA as short as possible
    private func removeCdatas(of code: inout String)  {
        RegularExpression(regex: "<!\\[CDATA\\[.*?\\]\\]>", validateString: code).forEach {
            code = code.replacingOccurrences(of: $0, with: "a")
        }
    }
    
    private func getTags(of code: String) -> Set<String> {
        return Set<String>(RegularExpression(regex: "<[A-Z]{1,9}>", validateString: code))
    }
    
    private func getTagsQueue(of code: String) -> [String] {
        return RegularExpression(regex: "</?[A-Z]{1,9}>", validateString: code)
    }
    // <TAG_NAME>  ---> </TAG_NAME>
    private func getEndTag(of startTags: Set<String>) -> (endTags:Set<String>,endToStart:[String:String]) {
        var ans = Set<String>()
        var map = [String:String]()
        for  startTag in startTags {
            var t = startTag
            t.insert("/", at: t.index(after: t.startIndex))
            ans.insert(t)
            map[t] = startTag
        }
        return (ans,map)
    }
    
    //Rule2
    private func checkTagPair(_ startTags: Set<String>, _ endTags: Set<String>, _ tagQueue: [String], _ map: [String:String] ) -> Bool {
        var stack = [String]()
        for idx in 0..<tagQueue.count {
            let tag = tagQueue[idx]
            if startTags.contains(tag) {
                stack.append(tag)
            } else {
                guard let st = map[tag], let lt = stack.last, st == lt else {
                    return false
                }
                stack.removeLast()
                // Rule1
                if idx != tagQueue.count - 1 {
                    guard !stack.isEmpty else {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }
    
    // Check whether additional '<' in code
    private func checkContains(_ character: Character, source str: String, _ startTags: Set<String>, _ endTags: Set<String>) -> Bool {
        var temp = str
        startTags.forEach { temp = temp.replacingOccurrences(of: $0, with: "")}
        endTags.forEach { temp = temp.replacingOccurrences(of: $0, with: "")}
        return temp.contains(character)
    }
}
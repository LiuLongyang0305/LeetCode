class Q884_Solution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        let str = A + " " + B
        var dic = Dictionary<String,Int>()
        var result = [String]()
        let subStr = str.split(separator: " ")
        let subs = subStr.map { String($0)}
        for sub in subs {
            if nil == dic[sub] {
                dic[sub] = 1
            } else {
                dic[sub] = dic[sub]! + 1
            }
        }
        for (key,value) in dic {
            if value == 1 {
                result.append(key)
            }
        }
        return result
    }
}
// https://leetcode.com/problems/unique-word-abbreviation/
class ValidWordAbbr {
    private var map = [String:Set<String>]()
    init(_ dictionary: [String]) {
        for str in dictionary {
            let key = getKey(str: str)
            if nil == map[key] {
                map[key] = []
            }
            map[key]?.insert(str)
        }
    }
    
    func isUnique(_ word: String) -> Bool {
        let key = getKey(str: word)
        guard let strs = map[key] else {
            return true
        }
        return strs == [word]
    }
    
    private func getKey(str: String) -> String {
        if str.count <= 2 {
            return str
        }
        return "\(str.first!)\(str.count - 2)\(str.last!)"
    }
}

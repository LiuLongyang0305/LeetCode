// https://leetcode.com/problems/shortest-word-distance-ii/
class WordDistance {
    private var words = [String]()
    private var memo = [String:[Int]]()
    private var N = -1
    init(_ words: [String]) {
        self.words = words
        self.memo = [:]
        self.N = words.count
        for i in 0..<words.count {
            if nil == memo[words[i]] {
                memo[words[i]] = []
            }
            memo[words[i]]?.append(i)
        }
        
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        guard let indices = memo[word1],let indices2 = memo[word2] else {
            return -1
        }
        var minDis = Int.max
        var i = 0
        var j = 0
        while i < indices.count && j < indices2.count{
            minDis = min(minDis, abs(indices[i] - indices2[j]))
            if indices[i] < indices2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return minDis
    }
    
}

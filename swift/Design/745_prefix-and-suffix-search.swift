// https://leetcode.cn/problems/prefix-and-suffix-search/
class WordFilter {

    private var map = [String:Int]()
    init(_ words: [String]) {
        let N = words.count
        for i in 0..<N {
            let M = words[i].count
            for pl in 1...M {
                for sl in 1...M {
                    let key = String(words[i].prefix(pl) + "_" + words[i].suffix(sl))
                    map[key] = i
                }
            }
        }
    }

    func f(_ pref: String, _ suff: String) -> Int {
        return map[pref + "_" + suff] ?? -1
    }
}
/**
 * Your WordFilter object will be instantiated and called as such:
 * let obj = WordFilter(words)
 * let ret_1: Int = obj.f(pref, suff)
 */

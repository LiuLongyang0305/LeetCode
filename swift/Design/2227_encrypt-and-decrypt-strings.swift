//  https://leetcode.com/problems/encrypt-and-decrypt-strings/
class Encrypter {
    private var keys = [Character]()
    private var reversedKey = [Character:Int]()
    private var values = [String]()
    private var dictionry = Set<Int>()
    private var valueToIndices = [String:[Int]]()


    private var possiblePreffix = [Set<Int>](repeating: [], count: 100 + 5)

    private let MOD = 1_000_000_007
    private let base = 171

    private var memo = [Int:Int]()

    init(_ _keys: [Character], _ _values: [String], _ _dictionary: [String]) {
        self.values = _values
        let N = _keys.count
        self.keys = _keys
        for idx in 0..<N {
            self.reversedKey[_keys[idx]] = idx
        }

        for (i,value) in _values.enumerated() {
            valueToIndices[value, default: []].append(i)
        }
        for word in _dictionary {
            var cur = 0
            var cnt = 0
            for ch in word {
                cnt += 1
                cur = (cur * base + Int(ch.asciiValue ?? 0) ) % MOD
                possiblePreffix[cnt].insert(cur)
            }
            self.dictionry.insert(cur)
        }

    }

    func encrypt(_ word1: String) -> String {
        var ans = ""
        for ch in word1 {
            ans += values[reversedKey[ch]!]
        }

        return ans
        // return word1.reduce("") { $0 +  values[reversedKey[$1]!]}
    }

    func decrypt(_ word2: String) -> Int {

        let hash = getHash(of: word2)

        guard nil == memo[hash] else {
            return memo[hash]!
        }

        let chars = [Character](word2)
        let N = word2.count - 1

        var ans = 0

        func dfs(_ i : Int, _ preffix: Int, _ cnt: Int) {
            if cnt != 0  {
                guard possiblePreffix[cnt].contains(preffix) else {return}
            }
            guard i < N else {
                if dictionry.contains(preffix) {
                    ans += 1
                }
                return
            }

            let now = "\(chars[i])\(chars[i + 1])"
            guard let indices = valueToIndices[now] else {
                return
            }
            for idx in indices {
                dfs(i + 2,  (preffix * base + Int(keys[idx].asciiValue ?? 0)) % MOD,cnt + 1)
            }
        }

        dfs(0, 0,0)
        defer {
            memo[hash] = ans
        }

        return ans
    }


    private func getHash(of word: String) -> Int {
        var ans = 0
        for ch in word {
            ans = (ans * 171 + Int(ch.asciiValue!)) % MOD
        }
        return ans
    }
}
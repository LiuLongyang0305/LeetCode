    //https://leetcode.cn/problems/longest-balanced-substring-ii/
class Solution {
    func longestBalanced(_ s: String) -> Int {
        let  chars = [Character](s)
        let N = chars.count
        let setChars = Set<Character>(s)
        var sb = 0
            //只有一种字母

        var i = 0
        while i < N {
            var j = i
            while j < N && chars[i] == chars[j] {
                j += 1
            }
            sb = max(sb, j - i)
            i = j
        }

        guard setChars.count > 1 else {return sb}

        //只包含两个字母
        guard setChars.count > 2 else {
            let existedChars = [Character](setChars)
            sb = max(sb, process(chars, existedChars[0], existedChars[1]))
            return sb
        }
        //包含三个字母
        //包含两个字母
        sb = max(sb,processTwoLetters(chars, "a", "b"),processTwoLetters(chars, "b", "c"),processTwoLetters(chars, "a", "c"))
        return max(sb,processThreeLetters(chars))
    }

    private func process(_ chars: [Character], _ first: Character, _ second: Character) -> Int {
        var sb = 0
        var map = [Int:Int]()
        map[0] = -1

        var c1 = 0
        var c2 = 0
        var M = chars.count

        for i in 0..<M {
            if chars[i] == first {
                c1 += 1
            } else if chars[i] == second {
                c2 += 1
            }
            let t = c1 - c2
            if let last = map[t] {
                sb = max(sb,i - last)
            } else {
                map[t] = i
            }
        }
        return sb
    }

    private func processTwoLetters(_ chars:[Character], _ first: Character, _ second: Character) -> Int {
        var sb = 0
        var indices = [Int]()
        let M = chars.count
        let set : Set<Character> = [first,second]

        for i in 0..<M {
            if !set.contains(chars[i]) {
                indices.append(i)
            }
        }

        if indices.first! > 0 {
            sb = max(sb,process([Character](chars[..<indices[0]]), first, second))
        }
        if indices.last! < M - 1 {
            sb = max(sb,process([Character](chars[(indices.last! + 1)...]), first, second))
        }
        let N = indices.count
        if N > 1 {
            for j in 1..<N {
                if indices[j] - indices[j - 1] > 2 {
                    let tc = [Character](chars[(indices[j - 1] + 1)..<indices[j]])
                    sb = max(sb,process(tc, first, second))
                }
            }
        }

        return sb
    }

    private func processThreeLetters(_ chars:[Character]) -> Int {

        var sb = 0
        let M = chars.count

        var map = [Int:Int]()
        map[(M << 32) | M] = -1
        var c1 = 0, c2 = 0, c3 = 0
        for i in 0..<M {
            switch chars[i] {
                case "a":
                    c1 += 1
                case "b":
                    c2 += 1
                case "c":
                    c3 += 1
                default:
                    break
            }
            let key = ((c1 - c2 + M) << 32) | ((c2 - c3) + M)
            if let v = map[key] {
                sb = max(sb,i - v)
            } else {
                map[key] = i
            }
        }

        return sb
    }
}

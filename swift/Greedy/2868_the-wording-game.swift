    //https://leetcode.cn/problems/the-wording-game/
extension Character {
        /// 返回当前字母的下一个字母（循环：z → a，Z → A）
        /// 非字母字符返回 nil
    var nextLetter1: Character? {
        guard self.isLetter else { return nil }

        let scalarValue = self.unicodeScalars.first!.value

        if self.isLowercase {
                // a(97) ~ z(122)
            if scalarValue == 122 {
                return nil
            }
            let next = scalarValue == 122 ? 97 : scalarValue + 1
            return Character(UnicodeScalar(next)!)
        } else {
                // A(65) ~ Z(90)
            if scalarValue == 90 {
                return nil
            }
            let next = scalarValue == 90 ? 65 : scalarValue + 1
            return Character(UnicodeScalar(next)!)
        }
    }
}

class Solution {
    func canAliceWin(_ a: [String], _ b: [String]) -> Bool {
        let M = a.count
        let N = b.count
        func solve(_ aliceLastchoosed: Int?, _ BobLastChoosed: Int?, _ isAliceTurn: Bool) -> Bool {
            if nil == aliceLastchoosed {
                return !solve(0, nil, false)
            }
            if !isAliceTurn {
                let aliceFirstLetter = a[aliceLastchoosed!].first!
                var targetSet = Set<Character>()
                targetSet.insert(aliceFirstLetter)
                if let target = aliceFirstLetter.nextLetter1 {
                    targetSet.insert(target)
                }

                for i in ((BobLastChoosed ?? -1) + 1)..<N {
                    let bf = b[i].first!
                    if  targetSet.contains(bf) && b[i] > a[aliceLastchoosed!]{
                        return !solve(aliceLastchoosed, i, true)
                    }
                }
                return false
            } else {
                let bobFirstLetter = b[BobLastChoosed!].first!
                var targetSet = Set<Character>()
                targetSet.insert(bobFirstLetter)
                if let target = bobFirstLetter.nextLetter1  {
                    targetSet.insert(target)
                }

                for i in (aliceLastchoosed! + 1)..<M {
                    let af = a[i].first!
                    if targetSet.contains(af) && a[i] > b[BobLastChoosed!] {
                        return !solve(i, BobLastChoosed, false)
                    }
                }
                return false


            }
        }
        return solve(nil,nil,true)
    }
}


    //https://leetcode.cn/problems/the-wording-game/
extension Character {
        /// 返回当前字母的下一个字母（循环：z → a，Z → A）
        /// 非字母字符返回 nil
    var nextLetter1: Character? {
        guard self.isLetter else { return nil }

        let scalarValue = self.unicodeScalars.first!.value

        if self.isLowercase {
                // a(97) ~ z(122)
            if scalarValue == 122 {
                return nil
            }
            let next = scalarValue == 122 ? 97 : scalarValue + 1
            return Character(UnicodeScalar(next)!)
        } else {
                // A(65) ~ Z(90)
            if scalarValue == 90 {
                return nil
            }
            let next = scalarValue == 90 ? 65 : scalarValue + 1
            return Character(UnicodeScalar(next)!)
        }
    }
}

class Solution {
    func canAliceWin(_ a: [String], _ b: [String]) -> Bool {
        var aliceHeap = Heap<String>(a)
        var bobHeap = Heap<String>(b)

        var last = aliceHeap.popMin()!
        var isAliceTurn = false

        while true {
            var firstLetterSet = Set<Character>()
            firstLetterSet.insert(last.first!)
            if let next = last.first!.nextLetter1 {
                firstLetterSet.insert(next)
            }
            if isAliceTurn {
                while let min = aliceHeap.min, min <= last {
                    aliceHeap.popMin()
                }
                if let min = aliceHeap.min, let f = min.first, firstLetterSet.contains(f) {
                    last = aliceHeap.popMin()!
                } else {
                    return false
                }

            } else {
                while let min = bobHeap.min, min <= last {
                    bobHeap.popMin()
                }
                if let min = bobHeap.min, let f = min.first, firstLetterSet.contains(f) {
                    last = bobHeap.popMin()!
                } else {
                    return true
                }
            }
            isAliceTurn.toggle()
        }


        return false
    }
}

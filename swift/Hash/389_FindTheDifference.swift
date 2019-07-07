class Q389_Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        typealias CharCount = (inSource:Int,inTarget:Int)
        var dic = Dictionary<Character,CharCount>()
        for ch in s {
            if nil != dic[ch]{
                dic[ch]!.inSource = (dic[ch]?.inSource)! + 1
            } else {
                dic[ch] = CharCount(1,0)
            }
        }
        for ch in t {
            if nil != dic[ch] {
                dic[ch]!.inTarget = (dic[ch]?.inTarget)! + 1
            } else {
                return ch
            }
        }
        
        //        let result = dic.filter { (arg0) -> Bool in
        //            let (_, value) = arg0
        //            return value.inTarget - value.inSource == 1
        //        }
        //        return (result.first?.key)!
        for (key,value) in dic {
            if value.inTarget - value.inSource == 1 {
                return key
            }
        }
        return " "
    }
}
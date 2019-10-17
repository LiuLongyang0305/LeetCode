//https://leetcode.com/problems/swap-for-longest-repeated-character-substring/
class Solution {
    typealias CharState = (length: Int,start:Int,end:Int)
    func maxRepOpt1(_ text: String) -> Int {
        
        let differentCharsLength = Set<Character>(text).count
        //text为空或者text里面所有字符一样
        guard  differentCharsLength > 1 else {
            return text.count
        }
        //text里面所有字符均不相同
        guard differentCharsLength != text.count else {
            return 1
        }
        
        var ans =  0
        
        //分组统计字符串连接情况
        var counter = [Character:[CharState]]()
        let chars = Array<Character>(text)
        var state: CharState  = (-1,0,-1)
        var i = 1
        while i < chars.count {
            if chars[i] != chars[i - 1] {
                state.end = i - 1
                state.length = state.end - state.start + 1
                if state.length > ans {
                    ans  = state.length
                }
                if nil == counter[chars[i  - 1]] {
                    counter[chars[i  - 1]] = [CharState]()
                }
                counter[chars[i  - 1]]?.append(state)
                state = (-1,i,-1)
            }
            i += 1
        }
        //最后一组字符的统计结果，不能忽略
        state.end = text.count - 1
        state.length = state.end - state.start + 1
        if nil == counter[chars.last!] {
            counter[chars.last!] = [state]
        } else {
            counter[chars.last!]?.append(state)
        }
        
        
        for (_,val) in counter {
            //只有一段，无法交换字符，且最大的情况已经考虑过
            if val.count == 2 {
                //两段，可以交换：（1）连接：两段长度相加（2）不能连接：每段长度会增加1
                ans = val[1].start - val[0].end  == 2 ? max(ans, val[1].length + val[0].length) : max(ans, val[0].length + 1, val[1].length + 1)
            }  else if val.count > 2 {
                //三段及以上，可以交换：连接则可能最大长度为两段长度相加再加1，否则为每段长度加1
                for i in 0..<(val.count  - 1) {
                    ans = val[i + 1].start - 2 == val[i].end ? max(ans, val[i].length + 1 +  val[i + 1].length) : max(ans, val[i].length + 1)
                }
                ans = max(val.last!.length  + 1,ans)
            }
        }
        return ans
    }
}

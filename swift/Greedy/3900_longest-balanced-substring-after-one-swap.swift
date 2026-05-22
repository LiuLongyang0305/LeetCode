// https://leetcode.cn/problems/longest-balanced-substring-after-one-swap/
class Solution {
    func longestBalanced(_ S: String) -> Int {
        let chars = Array(S) // 将字符串转为字符数组以便索引访问
        var total0 = 0
        
        // 统计字符串中'0'的总数
        for c in chars {
            if String(c) == "0" {
                total0 += 1
            }
        }
        let total1 = chars.count - total0 // '1'的总数等于总长度减'0'的数量
        
        // 前缀和映射表：key为前缀和sum，value为该sum出现的索引列表（最多存2个最早位置）
        var pos: [Int: [Int]] = [:]
        pos[0] = [-1] // 初始化前缀和为0的位置为-1（参考525题经典前缀和处理）
        
        var ans = 0 // 最终结果（最长平衡子串长度）
        var sum = 0 // 前缀和（'1'加1，'0'减1）
        
        // 遍历每个字符，计算前缀和并更新状态
        for i in 0..<chars.count {
            let c = chars[i]
            // 计算当前字符对前缀和的贡献：'1'→+1，'0'→-1
            let contribution = (String(c) == "1") ? 1 : -1
            sum += contribution
            
            // 处理当前前缀和的位置记录（最多保留2个最早索引）
            var list = pos[sum] ?? []
            if list.count < 2 {
                list.append(i)
                pos[sum] = list
            }
            
            // 情况1：不交换字符，直接取当前前缀和对应的最早位置计算长度
            if let p = pos[sum] {
                ans = max(ans, i - p[0])
            }
            
            // 情况2：交换子串内的1与子串外的0（寻找sum-2的前缀位置）
            if let p = pos[sum - 2] {
                let lengthCandidate = i - p[0]
                let adjustedLength = lengthCandidate - 2 // 扣除交换的两个字符影响
                if adjustedLength / 2 < total0 { // 剩余可调整的0足够
                    ans = max(ans, lengthCandidate)
                } else if p.count > 1 { // 若0不足，取次早位置缩短子串
                    ans = max(ans, i - p[1])
                }
            }
            
            // 情况3：交换子串内的0与子串外的1（寻找sum+2的前缀位置）
            if let p = pos[sum + 2] {
                let lengthCandidate = i - p[0]
                let adjustedLength = lengthCandidate - 2
                if adjustedLength / 2 < total1 { // 剩余可调整的1足够
                    ans = max(ans, lengthCandidate)
                } else if p.count > 1 {
                    ans = max(ans, i - p[1])
                }
            }
        }
        
        return ans
    }
}

// https://leetcode.com/problems/read-n-characters-given-read4-ii-call-multiple-times/
/**
 * The read4 API is defined in the parent class Reader4.
 *     func read4(_ buf4: inout [Character]) -> Int;
 */

class Solution : Reader4 {
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    
    
    private var buffer = [Character]()
    func read(_ buf: inout [Character], _ n: Int) -> Int {
        while buffer.count < n {
            var new = [Character](repeating: " ", count: 4)
            let received = read4(&new)
            guard received > 0 else {break}
            (0..<received).forEach {buffer.append(new[$0])}
        }
        guard !buffer.isEmpty else {return 0}
        let availableData = min(n, buffer.count)
        (0..<availableData).forEach {buf[$0] = buffer.removeFirst()}
    
        return availableData
    }
}

// https://leetcode.com/problems/design-phone-directory/
class PhoneDirectory {
    
    private var unused = Array<Bool>()
    /** Initialize your data structure here
     @param maxNumbers - The maximum numbers that can be stored in the phone directory. */
    init(_ maxNumbers: Int) {
        unused = Array<Bool>(repeating: true, count: maxNumbers)
    }
    
    /** Provide a number which is not assigned to anyone.
     @return - Return an available number. Return -1 if none is available. */
    func get() -> Int {
        if let index = unused.firstIndex(of: true) {
            unused[index] = false
            return index
        }
        return -1
    }
    
    /** Check if a number is available or not. */
    func check(_ number: Int) -> Bool {
        return unused[number]
    }
    
    /** Recycle or release a number. */
    func release(_ number: Int) {
        unused[number] = true
    }
}

/**
 * Your PhoneDirectory object will be instantiated and called as such:
 * let obj = PhoneDirectory(maxNumbers)
 * let ret_1: Int = obj.get()
 * let ret_2: Bool = obj.check(number)
 * obj.release(number)
 */
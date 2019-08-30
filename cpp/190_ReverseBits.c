#include <stdio.h>
uint32_t reverseBits(uint32_t n) {
    uint32_t arr[32] = {0};
    for (int i = 0; i < 32; ++i)
    {
    	arr[i]  = n & 1;
    	n >>= 1;
    }
    uint32_t ans = 0;
    uint32_t base = 1;
    for (int i = 31; i >= 0; --i)
    {
    	ans += (arr[i] * base);
    	base *= 2;
    }
    return ans;
}
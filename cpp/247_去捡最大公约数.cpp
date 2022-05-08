// https://www.acwing.com/problem/content/description/247/
#include <iostream>
#include <map>
#include <vector>
#include <set>
#include <string>
#include <algorithm>
#include <queue>
#include <stack>
#include <deque>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <numeric>
#include <cstring>
#include <cstdio>

#define leftChild(x) ((x) << 1)
#define rightChild(x) ((x) << 1 | 1)

using namespace std;
typedef long long LL;
typedef pair<int, int> PII;

const int N = 500010;
LL values[N];
struct Node
{
    int l, r;
    LL sum, _gcd;
} segmentTree[N << 2];

LL gcd(LL a, LL b)
{
    return b ? gcd(b, a % b) : a;
}
void pushup(Node &u, Node &l, Node &r)
{
    u.sum = l.sum + r.sum;
    u._gcd = gcd(l._gcd, r._gcd);
}

// int leftChild(int u) {
//     return u << 1;
// }
// int rightChild(int u) {
//     return u << 1 | 1;
// }


void pushup(int u)
{
    pushup(segmentTree[u], segmentTree[leftChild(u)], segmentTree[rightChild(u)]);
}

void build(int u, int l, int r)
{
    segmentTree[u].l = l;
    segmentTree[u].r = r;
    if (l == r)
    {
        segmentTree[u].sum = values[l] - values[l - 1];
        segmentTree[u]._gcd = values[l] - values[l - 1];
    }
    else
    {
        int mid = (l + r) >> 1;
        
        build(u << 1, l, mid);
        build(u << 1 | 1, mid + 1, r);
        pushup(u);
    }
}

void modify(int u, int x, LL v)
{
    if (segmentTree[u].l == x && segmentTree[u].r == x)
    {
        LL b = segmentTree[u].sum + v;
        segmentTree[u].sum = b;
        segmentTree[u]._gcd = b;
    }
    else
    {
        int mid = (segmentTree[u].l + segmentTree[u].r) >> 1;
        if (mid >= x)
        {
            modify(leftChild(u), x, v);
        }
        else
        {
            modify(rightChild(u), x, v);
        }
        pushup(u);
    }
}


Node query(int u, int l, int r)
{
    if (segmentTree[u].l == l && segmentTree[u].r == r)
    {
        return segmentTree[u];
    }
    else
    {
        int mid = (segmentTree[u].l + segmentTree[u].r) >> 1;
        if (mid >= r)
        {
            return query(leftChild(u), l, r);
        }
        else if (mid < l)
        {
            return query(rightChild(u), l, r);
        }
        else
        {
            Node left = query(leftChild(u), l, mid);
            Node right = query(rightChild(u), mid + 1, r);
            Node res;
            pushup(res, left, right);
            return res;
        }
    }
}

size_t arrSize;
int opeCnt;

void test()
{
    cin >> arrSize >> opeCnt;
    for (size_t i = 1; i <= arrSize; i++)
    {
        scanf("%lld", &values[i]);
    }
    build(1, 1, arrSize);
    int l, r;
    LL val;
    char op[2];
    while (opeCnt--)
    {
        scanf("%s%d%d", op, &l, &r);
        if (*op == 'Q')
        {
            Node left = query(1, 1, l);
            Node right({0, 0, 0, 0});
            if (l + 1 <= r)
            {
                right = query(1, l + 1, r);
            }
            printf("%lld\n", abs(gcd(left.sum, right._gcd)));
        }
        else if (*op == 'C')
        {
            scanf("%lld", &val);
            modify(1, l, val);
            if (r + 1 <= arrSize)
            {
                modify(1, r + 1, -val);
            }
        }
    }
}
int main()
{
    // cout << "Hello World!" << endl;
    test();
    return 0;
}
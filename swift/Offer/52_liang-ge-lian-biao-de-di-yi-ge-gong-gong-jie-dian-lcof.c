// https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
 typedef struct ListNode* ListNodePtr;
struct ListNode *getIntersectionNode(struct ListNode *headA, struct ListNode *headB) {
    ListNodePtr node1 = headA;
    ListNodePtr node2 = headB;
    while(node1 != node2) {
        node1 = node1 != NULL ? node1->next : headB;
        node2 = node2 != NULL ? node2->next : headA;
    }
    return node1;
}
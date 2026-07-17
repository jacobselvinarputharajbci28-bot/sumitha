/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

void merge(int* arr, int low, int mid, int high) {
    int* b = (int*)malloc((high - low + 1) * sizeof(int));
    int i = low;
    int j = mid + 1;
    int k = 0;
    while (i <= mid && j <= high) {
        if (arr[i] > arr[j]) {
            b[k] = arr[j];
            j++;
            k++;
        } else {
            b[k] = arr[i];
            i++;
            k++;
        }
    }
    while (i <= mid) {
        b[k] = arr[i];
        i++;
        k++;
    }
    while (j <= high) {
        b[k] = arr[j];
        j++;
        k++;
    }

    for (int i = 0; i < high - low + 1; i++) {
        arr[low + i] = b[i];
    }
    free(b);
}

int mergesort(int* arr, int low, int high) {
    if (low < high) {
        int mid = (low + high) / 2;
        mergesort(arr, low, mid);
        mergesort(arr, mid + 1, high);
        merge(arr, low, mid, high);
    }
    return 0;
}


struct ListNode* sortList(struct ListNode* head) {
    if (head == NULL) {
        return NULL;
    }
    int issorted, temp;
    struct ListNode* ptr = head;
    int i = 0;
    while (ptr != NULL) {
        ptr = ptr->next;
        i++;
    }
    int n = i;
    int* arr = (int*)malloc((n + 1) * sizeof(int));

    ptr = head;
    i = 0;
    while (ptr != NULL) {
        arr[i] = ptr->val;
        ptr = ptr->next;
        i++;
    }

    mergesort(arr, 0, n - 1);
    struct ListNode* first = malloc(sizeof(struct ListNode));
    struct ListNode* tail = first;

    first->val = arr[0];
    first->next = NULL;

    for (int i = 1; i < n; i++) {
        tail->next = malloc(sizeof(struct ListNode));
        tail = tail->next;
        tail->val = arr[i];
        tail->next = NULL;
    }

    free(arr);
    return first;
}

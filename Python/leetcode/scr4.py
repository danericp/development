from numpy import median
class Solution:
    def findMedianSortedArrays(self, nums1, nums2):
        nums3=nums1+nums2
        nums3.sort()
        return median(nums3)

list1 = [1, 2]
list2 = [3, 4]
obj_Solution = Solution()
print('Example List 1 is ' + str(list1))
print('Example List 2 is ' + str(list2))
print("\nGiven two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.\nSolution: " +
      str(obj_Solution.findMedianSortedArrays(list1, list2)))
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        answer, bool_isnega = 0, (True if (dividend*divisor<0) else False)
        print(bool_isnega)
        if dividend==0 or divisor==0:
            return 0
        elif abs(divisor)==1:
            print(dividend)
            return (dividend * (-1 if bool_isnega else 1))
        else:
            dividend, divisor = abs(dividend), abs(divisor)
            while True:
                if dividend<=divisor:
                    break
                answer += 1 if dividend>=divisor else 0
                dividend -= divisor
            return (answer * (-1 if bool_isnega else 1))

obj_test = Solution()
print(obj_test.divide(-2147483648, -1))
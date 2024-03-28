import math
from matplotlib import pyplot as plt




Primes  = [2, 3, 5, 7, 11, 13]
Upper_bound = 200
conseq = 0
Max = 0
Maximum = []
conseq_list = []
for number in range(2, (Upper_bound + 1)*(Upper_bound + 1)):
    Max = max(Max, conseq)
    Maximum.append(Max)
    if Max == 21:
        print(number)
        break
    find = 0
    conseq_list.append(conseq)
    for second_number in Primes:
        if number % second_number == 0:
            conseq += 1
            find = 1
            break
    if find ==0 :
        conseq = 0

plt.plot(Maximum)
plt.show()

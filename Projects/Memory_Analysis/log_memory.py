import math
import random
import matplotlib.pyplot as plt

Number_of_samples = list(range(0,1000))
Fraction_of_focus = 0.2
Rounds = 20
#----------------------------------------
Sensor_Data = set()
Round_count = []
for round in range(0,Rounds):

    for instance in Number_of_samples:
        
        if Fraction_of_focus > random.random():
            
            Sensor_Data.add(instance)
    
    Round_count.append(len(Sensor_Data))

diff = [0]
for instance in range(1,Rounds):
    diff.append(Round_count[instance] - Round_count[instance - 1] )

plt.plot(diff)
plt.scatter(list(range(0,len(Round_count))), Round_count)
plt.show()

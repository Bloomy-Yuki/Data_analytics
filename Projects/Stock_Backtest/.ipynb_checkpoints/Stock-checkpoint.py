# Stock backtest v0.2
# 
#   -added weekend interest calculation
#
# Stock backtest v0.1
# 
#
#
#
# importing libraries

from pandas import *
from matplotlib import pyplot

# declaring lists for the information to be imported 

Low_price = []
Closing_price = []
Daily_change = []
Horizon_average = []
Strategy = []
Stop_loss = -0.01
Costs = -0.000311
Leverage = 20
Horizon = 150
Upper_compound = 10
Lower_compound = 4
Horizon_thresh = 0.53


# I/O inserting values into lists low_price, Closing_price

data = read_csv("NDX.csv")
Closing_price = data['Close'].tolist()
Low_price = data['Low'].tolist()

# Filling the Daily_change list with values 
# *Notice that it doesnt reflect stop loss, but merely an indicator for the Stock trend 

Daily_change.append(0)
for day in range(1, len(Closing_price)):
    Daily_change.append( (Closing_price[day] - Closing_price[day - 1 ])/Closing_price[day - 1 ]) 

# Filling horizon average indicator
# *Using this to compute the compounding factor
        
for number in range(0, len(Closing_price)):
    
    success_rate = 0

    for day in range(0,Horizon):
        if Daily_change[number - day -1] > 0:
            success_rate += 1
    Horizon_average.append( success_rate/Horizon )

# Strategy filling
    
Strategy.append(0)
for number in range(1, len(Closing_price)):
    
    if Horizon_average[number - 1] < Horizon_thresh:
        compound = Upper_compound
    else:
        compound = Lower_compound
    
    if Strategy[number - 1] > 2:
        multi = 1 + (Strategy[number -1] - 1)/compound
    else:
        multi = 1

    if (Low_price[number] - Closing_price[number - 1])/Closing_price[number - 1] < Stop_loss - Costs :

        Strategy.append( Stop_loss*Leverage*multi + Strategy[number - 1] )
    else:
        
        Strategy.append(((Closing_price[number] - Closing_price[number - 1 ])/Closing_price[number - 1] + (Costs if (number + 1) % 5 != 0 else 3*Costs))*Leverage*multi + Strategy[number - 1])
        # modular division should be changed according to the day of the week of trading(Monday by default)
        
    
# Run 
        
pyplot.plot(Strategy)
pyplot.show()
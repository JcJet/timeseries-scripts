import matplotlib.pyplot as plt
import ruptures as rpt
import numpy as np
import csv
from array import array
with open('/home/jet/Downloads/btc.csv', newline='') as csvfile:
    data = list(csv.reader(csvfile))
arr = array("f")
for item in data:
    arr.append(float(item[0]))
arr = np.array(arr)
arr = np.log10(arr)
arr = np.diff(arr)
algo = rpt.Pelt().fit(arr)
result = algo.predict(pen=10)

rpt.display(arr, range(len(result)), result)
plt.show()
# generate signal
#n_samples, dim, sigma = 1000, 3, 4
#n_bkps = 4  # number of breakpoints
#signal, bkps = rpt.pw_constant(n_samples, dim, n_bkps, noise_std=sigma)

## detection
#algo = rpt.Pelt(model="rbf").fit(signal)
#result = algo.predict(pen=10)

## display
#rpt.display(signal, bkps, result)
#plt.show()
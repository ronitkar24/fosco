import librosa
import matplotlib.pyplot as plt
import librosa.display

filename = '/Users/gaoxiangzhou/Downloads/sound_samples/rapid.mp3'

data, sr = librosa.load(filename)

plt.figure(figsize=(14, 5))
librosa.display.waveshow(data, sr=sr)

X = librosa.stft(data)
Xdb = librosa.amplitude_to_db(abs(X))
plt.figure(figsize=(14, 5))
librosa.display.specshow(Xdb, sr=sr, x_axis='time', y_axis='hz')

import seaborn
import numpy, scipy, matplotlib.pyplot as plt, librosa, IPython.display as ipd
import urllib

x, sr = librosa.load(filename)
ipd.Audio(x, rate=sr)
X = numpy.fft.fft(x)
X_mag = numpy.absolute(X)
f = numpy.linspace(0, sr, len(X_mag))
plt.figure(figsize=(14, 5))
plt.plot(f, X_mag)
plt.xlabel('Frequency, Hz')

segment =[]
for i in range(7500, len(f)-7500):
    if X_mag[i] == max(X_mag[i-7500:i+7500]):
        segment.append(f[i])

if (max(segment)> 20000) and max(segment)-min(segment)>10000:
    print('Health Breath')
else:
    print('Unhealth Breath')

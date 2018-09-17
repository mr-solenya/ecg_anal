function signal=loadingfunction(y)
signal=(y-1024)/360;% 360 has been selected as the common sampling frequency
plot(signal)
title('Chosen ECG signal');
end

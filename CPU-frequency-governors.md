# CPU frequency governors

CPUs are often configured to use a lower operating frequency when under a light load in order to conserve power. We recommend to disable this feature as it leads to higher latencies when using any computationally-heavy software. To check and modify the power saving mode, install the cpufrequtils package:

```
sudo apt install cpufrequtils
```

Run cpufreq-info to see available “governors” and the current CPU frequency. You will get something like this:
```
  maximum transition latency: 4294.55 ms.
  hardware limits: 800 MHz - 4.30 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 800 MHz and 4.30 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 898 MHz.
```
In this case, the maximum frequency is 4.3 GHz, but the current one is 898 Mhz due to the **powersave** policy. In this case we can benefit by setting the governor to **performance**:

```
  maximum transition latency: 4294.55 ms.
  hardware limits: 800 MHz - 4.30 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 800 MHz and 4.30 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 4.06 GHz.
```

To change this setting using the Ubuntu GUI, install the `indicator-cpufreq` package, a widget in the top bar of the Unity user interface which allows you to set the current policy.

```
sudo apt install indicator-cpufreq
```

To change this setting using the terminal, execute the following commands:
```
sudo systemctl disable ondemand
sudo systemctl enable cpufrequtils
sudo sh -c 'echo "GOVERNOR=performance" > /etc/default/cpufrequtils'
sudo systemctl daemon-reload && sudo systemctl restart cpufrequtils
```

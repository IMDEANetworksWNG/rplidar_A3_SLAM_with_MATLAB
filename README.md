## IMDEA rplidar A3 SDK for MATLAB

#### How to build

1. Go into the Take_measurements foder

```
cd Take_measurements
```
2. Compile it
```
make
```
3. The program will be in
```
Take_measurements/output/Linux/Release/measure
```

#### How to take measurements

1. Make sure both USB ports of the rplidar are connected
2. Copy the measure binary anywere or just go to the ouput (Take_measurements/output/Linux/Release/measure) folder
3. Run it

**Note:** The program assumes that the lidar is on /dev/ttyUSB0, if that is not the case you can call the program with the correct path
```
sudo ./measure
```
4. When the measuremen is done just press Ctrl + C
5. The file will be named output.txt
6. Since the program is run under sudo, you need to change its permissions
```
sudo chown $USER:$USER output.txt
```

#### How to process the measurements (SLAM, MATLAB)

**Note:** Either the Robotics toolbox or the Mapping toolbox are required to do SLAM

1. Drop your measurement files on SLAM/input
2. Modify the SLAM code, add the filenames on the array of the first for
```
# Assuming we have corridor.txt and lab.txt the first line should be
for filename=["corridor", "lab"]
```
3. Run it
4. The program will automatically save the finished SLAM algorithm as well as the measurement times in the output folder with the same filename


#### The output files
When loading the .mat you will have a slamAlg and a times variables. The first one is the finished SLAM, you can directly plot it with show(slamAlg). The times variable have the timestamp from the beginning of the measurement where each point was measured.

For any questions contact Pablo Jiménez Mateo at pablo.jimenezmateo@imdea.org




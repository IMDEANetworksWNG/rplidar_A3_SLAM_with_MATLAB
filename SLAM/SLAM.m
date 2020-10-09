for filename=["output"]

    [scans, times] = Get_scans_from_file(join(['input/' filename '.txt'], ''));
    
    % Actually it is 25 meters, but 23 is more accurate
    maxLidarRange = 23;
    mapResolution = 20;
    slamAlg = lidarSLAM(mapResolution, maxLidarRange);

    slamAlg.LoopClosureThreshold = 210;  
    slamAlg.LoopClosureSearchRadius = 8;

    firstTimeLCDetected = false;

    tic;
    for i=1:length(scans)
        [isScanAccepted, loopClosureInfo, optimizationInfo] = addScan(slamAlg, scans{i});
        if ~isScanAccepted
            continue;
        end
    end

    save(join(['output/' filename '.mat'], ''), 'slamAlg', 'times')
    
    toc;
    
    %figure
    %show(slamAlg);
    %title({'Final Built Map of the Environment', 'Trajectory of the Robot'});

end
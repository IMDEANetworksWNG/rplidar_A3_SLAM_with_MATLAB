% Reads and loads the data file

function [scans, times] = Get_scans_from_file(filename)

    fid = fopen(filename);
    tline = fgetl(fid);

    scans = {};
    times = [];

    while ischar(tline)

        if contains(tline, 'SCAN_START')

            % Create the object
            angles = [];
            ranges = [];
            
            % Extract the time
            time = str2num(extractAfter(tline, "SCAN_START "));
            times(end+1) = time;

        elseif strcmp(tline, 'SCAN_END')

            scan = lidarScan(ranges, angles);
            scans{end +1} = scan;
        else

            values = split(tline, ",");

            angles(end+1) = deg2rad(str2num(values{1}));
            ranges(end+1) = str2num(values{2})/1000;
        end

        tline = fgetl(fid);
    end

    fclose(fid);
end


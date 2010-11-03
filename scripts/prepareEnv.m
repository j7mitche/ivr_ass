function [nomaze, maze, mazewR] = prepareEnv(MODE)
    
% if MODE==1 then webots, 2 for khepera robot
if (MODE == 1)
    
    nomaze = 'nomaze_webots.jpg';
    
    %input('Press enter when maze snaphsot taken');
    %take_snap();
    %unix('cp /tmp/snapshot.ppm ~/snapshot_maze.ppm');
    maze = '~/snapshot_maze.ppm';
    
    %input('Press enter when maze with robot snaphsot taken');
    %take_snap();
    %unix('cp /tmp/snapshot.ppm ~/snapshot_mazewR.ppm');
    mazewR = '~/snapshot_mazewR2.ppm';
   
else
    %input('Press enter when maze removed');
    %takePicture();
    %unix('cp 00000005.jpg nomaze.jpg');
    nomaze = 'nomaze.jpg';
    
    %input('Press enter when maze placed'); 
    %takePicture();
    %unix('cp 00000005.jpg maze.jpg');
    maze = 'maze.jpg';
    
    %input('Press enter when obstacles placed');
    %takePicture();
    %unix('cp 00000005.jpg obstacles.jpg');
    mazewR = 'obstacles.jpg';
end

end
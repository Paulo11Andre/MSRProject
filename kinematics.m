q1=0;
q2=0;
q3=0;
q4=0;
q5=0;
q6=0;
% Define DH parameters for the KUKA KR210 2f model
alpha = [-pi/2, 0, pi/2, pi/2, 0, 0];
a = [.33, .135, .115, 0, 0, .24];
d = [0.645, 0, 0, 1.42, 0, 0];
theta = [q1, q2, q3+pi/2, q4+pi/2, q5+pi, q6+pi/2];

% Preallocate transformation matrix
T = eye(4);

% Iterate through each joint
for i = 1:6
    % Compute transformation matrix for current joint
    Ti = [cos(theta(i)), -sin(theta(i))*cos(alpha(i)), sin(theta(i))*sin(alpha(i)), a(i)*cos(theta(i));
          sin(theta(i)), cos(theta(i))*cos(alpha(i)), -cos(theta(i))*sin(alpha(i)), a(i)*sin(theta(i));
          0, sin(alpha(i)), cos(alpha(i)), d(i);
          0, 0, 0, 1];
    % Update overall transformation matrix
    T = T*Ti;
end

% Extract position and orientation from overall transformation matrix
position = T(1:3,4);
orientation = T(1:3,1:3);

% Display results
disp('Position:');
disp(position);
disp('Orientation:');
disp(orientation);

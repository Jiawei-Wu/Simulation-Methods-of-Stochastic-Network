x1 = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
x2 = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
[X1,X2] = meshgrid(x1,x2);  % Obtain 100x100 pairs of points in matrix form from vectors x and y
d = 2;
Z = 4.189829 * d - X1 .* sin(sqrt(abs(X1))) - X2 .* sin(sqrt(abs(X2)));
N=50;
z_min(1:N) = 100;
global_min = z_min(1);
for j = 1:N
    point(1,:) = [0, 0];
    z(1) = 4.189829 * d - 0 .* sin(sqrt(abs(0))) - 0 .* sin(sqrt(abs(0)));
    N = 1000;
    T = 100;
    for i = 2 : N
        mu = 0;
        sigma = 5.5;
        noise = normrnd(mu,sigma,[1,2]);
        temp_point = point(i-1,:) + noise;
        temp_z = 4.189829 * d - temp_point(1) * sin(sqrt(abs(temp_point(1)))) - temp_point(2) * sin(sqrt(abs(temp_point(2))));
        p = exp((temp_z - z(i-1))/T);
%%Comparing the behavior of simulation using exponential, polynomial and
%%logarithmic cooling schedules
%%exponential cooling schedule:p = exp((temp_z - z(i-1))/T);
%%polynomial cooling schedule:p = (temp_z - z(i-1))/T;
%%logarithmic cooling schedule:p = log((temp_z - z(i-1))/T);
        if (z(i-1) > temp_z)
            z(i) = temp_z;
            point(i, :) = temp_point;
        else
            if (rand(1) > p)
                z(i) = z(i-1);
                point(i, :) = point(i-1, :);
            else
                z(i) = temp_z;
                point(i, :) = temp_point;
            end
        end
        T = 100*log(i+1);
        if (z(i) < z_min(j))
            z_min(j) = z(i);
            if z_min(j) < global_min
                global_min = z_min(j);
                path = point;
            end
        end
    end
end
figure(1);
hist(z_min);
xlabel('The Global Minimum');
ylabel('The Occurence Time');
title('Histogram Showing the Global minimums for Each Case');
figure(2);
contour(X1,X2,Z); % Plot a contour plot
colorbar;
title('The Contour Plot');
figure(3);
contour(X1,X2,Z); % Plot a contour plot
colorbar;
hold on
plot(path(:,1), path(:,2), 'ro');
line(path(:,1),path(:,2));
title('The Contour Plot overlayed with the Best Estimates');
hold off;
figure(4);
mesh(X1,X2,Z); % Plot a mesh plot
colorbar;
xlim([-500 500]);
ylim([-500 500]);
title('The Mesh Plot');

%%Run simulation with different iteration counts.
%%N=50;
%%N=200;
%%N=1000;


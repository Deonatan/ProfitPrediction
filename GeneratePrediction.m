data = load('ProfitPopulationData.txt');
X = data(:,1 ); y = data(:, 2); 
m = length(y); 
%Plot Initial Data 
PlotData(X,y);  

%Add theta0 
X = [ones(m,1), data(:,1)]; 
theta = zeros(2,1) ;

%Gradient Descent tune
iterations = 1500; 
alpha = 0.01;
 
%Run Cost function
fprintf('\nRunning Cost Function') 
J = computeCost(X, y, theta);
fprintf('Cost Function Value : %f' , J) 

%Run Gradient Descent
fprintf('\nRunning Gradient Descent,')
theta = gradientDescent(X , y, theta, alpha , iterations); 
fprintf('\nTheta found by gradient descent:\n');
fprintf('%f\n', theta); 

%Plot linear fit 
hold on; 
plot(X(:,2) , X*theta, '-') 
legend('Training data' , 'Linear regression') 
hold off; 

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000); 
    
% Cost Function and Theta visualization 
fprintf('Visualizing J(theta_0 , theta_1) ...\n') 

theta0_vals = linspace(-10 , 10 , 100); 
theta1_vals = linspace(-1, 4 , 100); 

J_vals = zeros(length(theta0_vals), length(theta1_vals)); 
for i = 1:length(theta0_vals) 
  for j = 1:length(theta1_vals) 
    t = [theta0_vals(i) ; theta1_vals(j)]; 
    J_vals(i,j) = computeCost(X, y,t) ; 
  endfor
endfor 

fprintf('Press enter to view the 3D plot of theta and Cost Function relations.\n')
pause; 
%3D plot 
J_vals = J_vals' ; 
figure; 
surf(theta0_vals, theta1_vals, J_vals) 
xlabel('\theta_0'); ylabel('\theta_1') ; 

fprintf('Press enter to view the Contour plot of theta and Cost Function relations.\n')
pause; 
%Contour plot 
figure; 
contour(theta0_vals , theta1_vals, J_vals, logspace(-2,3,20))
xlabel('\theta_0'); ylabel('\theta_1') ; 
hold on; 
plot(theta(1) , theta(2), 'rx' , 'MarkerSize' , 10, 'LineWidth' , 2) ; 






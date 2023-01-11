% Mandelbrot set
% Generate the Mandelbrot set and plot it using GNU Octave

% Set the maximum number of iterations and the threshold
max_iter = 100;
threshold = 2;

% Create a blank image to store the Mandelbrot set
img = zeros(1600, 1600);

% Create a figure window to display the plot
figure(1,'position', [200,100,1500,900])

% Loop through the upper half of the image pixels
for y = 1:800
  for x = 1:1600
    % Convert the pixel coordinates to complex numbers
    z = (x - 800) / 400 + (y - 800) / 400 * 1i;

    % Iterate the function f(z) = z^2 + c
    c = z;
    for n = 1:max_iter
      if abs(z) > threshold
        break
      end
      z = z^2 + c;
    end

    % Store the number of iterations in the image
    img(y, x) = n;

    % Use the symmetry of the Mandelbrot set to fill in the lower half of the image
    img(1600 - y + 1, x) = n;
  end

  % Update the plot every 20 iterations
  if mod(y, 20) == 0
    imagesc(img);
    colormap(jet);
    drawnow;
  end
end

% Display the final image
imagesc(img);
colormap(jet);

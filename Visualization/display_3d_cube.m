function h = display_3d_cube(x, edge)
%DISPLAY_3D_CUBE Display the surface of 3d-cube

    if nargin<2
        edge = 1;
    end
    
    
    [nx, ny, nz] = size(x);
    
    [xy, yx] = meshgrid(1:nx, 1:ny);
    [xz, zx] = meshgrid(1:nx, 1:nz);
    [yz, zy] = meshgrid(1:ny, 1:nz);
    
    figure; hold on;
    
    mesh(xy, yx, ones(nx, ny)', squeeze(x(:, :, 1))');
    mesh(xy, yx, nz*ones(nx, ny)', squeeze(x(:, :, nz))');
    
    mesh(xz, ones(nx, nz)', zx, squeeze(x(:, 1, :))');
    mesh(xz, ny*ones(nx, nz)', zx, squeeze(x(:, ny, :))');
    
    mesh(ones(ny, nz)', yz, zy, squeeze(x(1, :, :))');
    mesh(nx*ones(ny, nz)', yz, zy, squeeze(x(nx, :, :))');
    
    if edge
        plot3([1, nx], [1, 1], [1, 1], 'Color', 'k', 'LineWidth', 2);
        plot3([1, nx], [1, 1], [nz, nz], 'Color', 'k', 'LineWidth', 2);
        plot3([1, nx], [ny, ny], [1, 1], 'Color', 'k', 'LineWidth', 2);
        plot3([1, nx], [ny, ny], [nz, nz], 'Color', 'k', 'LineWidth', 2);
        
        plot3([1, 1], [1, ny], [1, 1], 'Color', 'k', 'LineWidth', 2);
        plot3([1, 1], [1, ny], [nz, nz], 'Color', 'k', 'LineWidth', 2);
        plot3([nx, nx], [1, ny], [1, 1], 'Color', 'k', 'LineWidth', 2);
        plot3([nx, nx], [1, ny], [nz, nz], 'Color', 'k', 'LineWidth', 2);
  
        
        plot3([1, 1], [1, 1], [1, nz], 'Color', 'k', 'LineWidth', 2);
        plot3([nx, nx], [1, 1], [1, nz], 'Color', 'k', 'LineWidth', 2);
        plot3([1, 1], [ny, ny], [1, nz], 'Color', 'k', 'LineWidth', 2);
        plot3([nx, nx], [ny, ny], [1, nz], 'Color', 'k', 'LineWidth', 2);
    end
    colormap jet;
    view(3);
    
    h = gca;
end


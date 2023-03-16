function h = display_3d_slice(x, d1, d2, d3, edge)
%DISPLAY_3D_SLICE 
    if nargin<5
        edge = 1;
    end
    
    [nx, ny, nz] = size(x);
    
    [xy, yx] = meshgrid(1:nx, 1:ny);
    [xz, zx] = meshgrid(1:nx, 1:nz);
    [yz, zy] = meshgrid(1:ny, 1:nz);
    
    figure; hold on;
    
    mesh(d1*ones(ny, nz)', yz, zy, squeeze(x(d1, :, :))');
    mesh(xz, d2*ones(nx, nz)', zx, squeeze(x(:, d2, :))');
    mesh(xy, yx, d3*ones(nx, ny)', squeeze(x(:, :, d3))');
    
    if edge
        plot3([d1, d1], [1, d2], [1, 1], 'Color', 'k', 'LineWidth', 2);
        
        plot3([1, 1], [d2, d2], [1, 1], 'Color', 'k', 'LineWidth', 2);
        
        plot3([1, 1], [1, 1], [d3, d3], 'Color', 'k', 'LineWidth', 2);
    end
    
    colormap jet;
    view(3);
    h = gca;
end


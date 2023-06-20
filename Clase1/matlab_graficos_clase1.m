x_graph_cubesat=zeros(1,length(out.N_r_H2N));
y_graph_cubesat=zeros(1,length(out.N_r_H2N));
z_graph_cubesat=zeros(1,length(out.N_r_H2N));

graph_frames=1;
step_3d_animation=10;
for i=1:step_3d_animation:length(out.N_r_H2N)
    aux=out.N_r_H2N(i,:);
    disp(norm(aux));
    x_graph_cubesat(graph_frames)=aux(1,1);
    y_graph_cubesat(graph_frames)=aux(1,2);
    z_graph_cubesat(graph_frames)=aux(1,3);
    graph_frames=graph_frames+1;
end
% Creating Figure
figure; hold on
title('Leyes de Newton', 'Interpreter', 'Latex')
xlabel('x', 'Interpreter', 'Latex')
ylabel('y', 'Interpreter', 'Latex')
zlabel('z', 'Interpreter', 'Latex')
axis equal
grid minor
view(45, 45)

rm = 6378; % Radius of Earth [km]
folder='figures';
filename='earth_3d.png';%1000x476
earth3dtexture=imread(fullfile(folder,filename));

[xEarth, yEarth, zEarth] = sphere;
surf(rm*xEarth,rm*yEarth,rm*zEarth, earth3dtexture, 'FaceColor', 'texturemap');
% Plotting Trajectory

h1=plot3(x_graph_cubesat(1),y_graph_cubesat(1),z_graph_cubesat(1),'r','LineWidth',1);
h2=plot3(x_graph_cubesat(1),y_graph_cubesat(1),z_graph_cubesat(1),'-o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
pause(1);
for k=2:(graph_frames-1)
    x=x_graph_cubesat(1:k);
    y=y_graph_cubesat(1:k);
    z=z_graph_cubesat(1:k);
    set(h1,'xdata',x,'ydata',y,'zdata',z)
    set(h2,'xdata',x(k),'ydata',y(k),'zdata',z(k))
    pause(0.01);
end
hold off



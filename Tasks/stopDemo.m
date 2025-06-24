f1=figure
plot(garden)
daspect([1 1 1])
hold on;

pos = out.logsout.getElement('state').Values.Data(:,1:2);
theta = out.logsout.getElement('state').Values.Data(:,3);
leftCoil = squeeze(out.logsout.getElement('leftCoil').Values.Data);
rightCoil = squeeze(out.logsout.getElement('rightCoil').Values.Data);
rearCoil = squeeze(out.logsout.getElement('rearCoil').Values.Data);


%plot(leftCoil(1,1:100:end),leftCoil(2,1:100:end),'ro')
%plot(rightCoil(1,1:100:end),rightCoil(2,1:100:end),'bo')
plot(pos(:,1),pos(:,2),'LineWidth',2)

% animation

mower = [-0.1 -0.08 0.08 0.1 0.45 0.5 0.52 0.5 0.45 0.1 0.08 -0.08 -0.1 -0.1; -0.25 -0.27 -0.27 -0.25 -0.25 -0.1 0 0.1 0.25 0.25 0.27 0.27 0.25 -0.25];
plot(mower(1,:),mower(2,:))

f2= figure
plot(garden)
axis equal
grid minor
daspect([1 1 1])
hold on;
for i = 1:1000:length(pos)
    if exist('pLC')
        delete(pLC);
    end
    if exist('pRC')
        delete(pRC);
    end
    if exist('pRearC')
        delete(pRearC);
    end
    if exist('pMower')
        delete(pMower)
    end
    rot = [cos(theta(i)) -sin(theta(i)); sin(theta(i)) cos(theta(i))];
    rotMower(1,:) = pos(i,1) + rot(1,:)*mower;
    rotMower(2,:) = pos(i,2) + rot(2,:)*mower;
    pMower = plot(rotMower(1,:),rotMower(2,:),'k','Linewidth',2);
    pLC = plot(leftCoil(1,i),leftCoil(2,i),'ro');
    pRC = plot(rightCoil(1,i),rightCoil(2,i),'bo');
    pRearC = plot(rearCoil(1,i),rearCoil(2,i),'yo');
    title("Animation at time " +string(duration(0,0,i/100)))
    pause(0.01)
end

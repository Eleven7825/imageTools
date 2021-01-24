% Copyright Shiyi Chen (sc7825@nyu.edu)
% You can use, modify, distribute this program 
% GNU 3.0 or higher versions

if ~exist('frame','var'); frame = imread('sample_image.jpg'); end
conti = 1;
if ~exist('contCell','var'); contCell = {}; end
n = 200;
i = 1;
imshow(frame);
sizeframe = size(frame);

while conti == 1
    [x,y,z] = ginput(1);
    hold on
%     imshow(frame)
    plot(x,y,'r.')
    contList = [x,y];
    hold off
    
    while 1==1
        [x,y,z] = ginput(1);
        
        if isempty(z)
            break
        end
        
        switch z
            case 1
                hold on
                
                contList = [contList;[x,y]];
                plot(contList(:,1),contList(:,2),'r.-')
                hold off
                continue
                
            case 122
                if size(contList,1)>1
                    hold on
                    contList = contList(1:end-1,:);
                    plot(contList(end,1),contList(end,2),'b.')
                    hold off
                elseif size(contList,1)==1
                    contList = [];
                end
                continue
                
            otherwise
                continue
        end
    end
        
    contCell{i} = contList;
    hold on
    patch(contList(:,1),contList(:,2),'black');
    plot(contList(:,1),contList(:,2));
    hold off
    conti = input('Press 1 to continue, other number to exist');
    i = i+1;
end


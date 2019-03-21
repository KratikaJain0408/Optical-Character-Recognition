
% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [output] = relu_forward(input, layer)
% RELU foward

% Args:
% input: a cell array contains input data and shape information
% layer: one cnn layer, defined in testLeNet.m

% Returns:
% output: a cell array contains output data and shape information

output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

output.data = zeros(size(input.data));

% TODO: your implementation goes below this comment
% implementation begins
h = input.height;
w = input.width;
c = input.channel;
for batch1 = 1:input.batch_size
    in1 = input.data(:, batch1);
    for i = 1:(h*w*c)
        if in1(i) < 0 
           in1(i) = 0;
        end
    end
    output.data(:,batch1) =  in1; 
end
% implementation ends

assert(all(size(output.data) == size(input.data)), 'output.data does not have the right length');

end

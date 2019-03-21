% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [output] = inner_product_forward(input, layer, param)
% Fully connected layer forward

% Args:
% input: a cell array contains input data and shape information
% layer: one cnn layer, defined in testLeNet.m
% param: parameters, a cell array

% Returns:
% output: a cell array contains output data and shape information

d = size(input.data, 1);
k = size(input.data, 2);
n = size(param.w, 2);

output.height = 1;
output.width = 1;
output.channel = layer.num;
output.batch_size = input.batch_size;

output.data = zeros([n, k]);

% TODO: your implementation goes below this comment
% implementation begins 
for batch2 = 1:input.batch_size 
    in2 = input.data(:, batch2);
    for i = 1:layer.num
        output.data(i,batch2) = param.b(i) + sum(in2(:,1).*param.w(:,i));
    end
end
% implementation ends

assert(all(size(output.data) == [n, k]), 'output.data does not have the right length');

end




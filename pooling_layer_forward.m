% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [output] = pooling_layer_forward(input, layer)
% Pooling forward

% Args:
% input: a cell array contains output data and shape information
% layer: one cnn layer, defined in testLeNet.m

% Returns:
% output: a cell array contains output data and shape information

h_in = input.height;
w_in = input.width;
c = input.channel;
batch_size = input.batch_size;
k = layer.k;
pad = layer.pad;
stride = layer.stride;

h_out = (h_in + 2*pad - k) / stride + 1;
w_out = (w_in + 2*pad - k) / stride + 1;

output.height = h_out;
output.width = w_out;
output.channel = c;
output.batch_size = batch_size;

output.data = zeros([h_out * w_out * c, batch_size]);

% TODO: your implementation goes below this comment
% implementation begins
for batch = 1:batch_size
    reshaped = reshape(input.data(:, batch), [h_in, w_in, c]);   
    for channels = 1:c
        for width = 1:w_out
            for height = 1:h_out
                z = zeros(1,k);
                for i = 1:k
                    array = reshaped(i + (height-1)*stride, 1 + (width-1)*stride:k + (width-1)*stride, channels);
                    z(1,i) = max(array(:));
                end
                r = (channels-1)*h_out*w_out + h_out*(width-1) + height;
                output.data(r,batch) = max(z(:));
            end
        end
    end
end
% implementation ends

assert(all(size(output.data) == [h_out * w_out * c, batch_size]), 'output.data does not have the right length');

end


% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [input_od] = pooling_layer_backward(output, input, layer)
% Pooling backward

% Args:
% output: a cell array contains output data and shape information
% input: a cell array contains input data and shape information
% layer: one cnn layer, defined in testLeNet.m

% Returns:
% input_od: gradients w.r.t input data


input_od = zeros(size(input.data));

% TODO: your implementation goes below this comment
% implementation begins
h_in = input.height; 
w_in = input.width; 
c = input.channel;
h_out = (h_in + 2*layer.pad - layer.k) / layer.stride + 1; 
w_out = (w_in + 2*layer.pad - layer.k) / layer.stride + 1; 
for i = 1:size(input.data,2)
    reshaped = reshape(input.data(:,i),[h_in, w_in, c]);
    reshaped1 = reshape(output.diff(:,i),[h_out, w_out, c]);
    for channels = 1:c
        for width = 1:w_out
            for height = 1:h_out
                a = -10000;
                for m = 1:layer.k
                    for n = 1:layer.k
                        if reshaped(layer.stride*(height-1)+m, layer.stride*(width-1)+n, channels) > a
                            a = reshaped(layer.stride*(height-1)+m, layer.stride*(width-1)+n, channels);
                            max_m = layer.stride*(height-1) + m;
                            max_n = layer.stride*(width-1) + n;
                        end
                    end
                end
                j = h_in*w_in*(channels-1) + h_in*(max_n-1) + max_m;
                input_od(j,i) = reshaped1(height,width,channels);
            end
        end
    end
end
% implementation ends

assert(all(size(input.data) == size(input_od)), 'input_od does not have the right length');

end

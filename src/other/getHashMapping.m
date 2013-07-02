function [ map ] = getHashMapping( code_size )
%GETMAPPING Summary of this function goes here
%   Detailed explanation goes here

    % get the total number of possible codes
    table_size = 2^code_size - 1;
    
    % init mapping table
    map = containers.Map('KeyType', 'uint32', 'ValueType', 'any');
    %table = 0:table_size;
    index_converted = 0;
    
    % get the maximum number of representation in LBP uniform
    % plus 1 for all non uniform codes
    % plus 1 since matlab index starts from 1
    max_codes = code_size*(code_size - 1) + 2 + 1;
    
    for i = 0:table_size
        
        % convert a decimal number to a binary representation
        % in vector form
        n = bitget(i,1:code_size);
        % left-rotate
        n_rotated = circshift(n, [0 1]);
        num_transition = sum(xor(n, n_rotated));
   
            
        if ( num_transition <= 2 )
            %table(i+1) 
            map(i) = index_converted;
            index_converted = index_converted + 1;
        else
            % non uniform nodes take value max_codes
            % -1 since the codes starts from 0
            map(i) = max_codes - 1;
        end
        
    end
    
end


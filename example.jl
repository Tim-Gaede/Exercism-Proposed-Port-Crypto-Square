function cipher_text(plain_text::String)
    # Remove all non-alphanumeric characters and put to lowercase
    text = ""
    for char in plain_text
        if isletter(char)  ||  isnumeric(char)
            text *= lowercase(char)
        end
    end



    # Set the dimensions of a rectangle
    root_ = floor(√(length(text)))
    R = convert(Int64, root_) # number of R
    R^2 == length(text)    ?    C = R    :    C = R + 1
    if R*C < length(text);    R += 1;    end



    # Define a rectangle and fill the rectangle with the chars
    chars = [' '    for r = 1:R, c = 1:C]
    for n = 0 : length(text)-1
        c = n%C + 1
        r = n÷C + 1
        chars[r, c] = text[n+1]
    end



    # Read out all but the last of the rectangle's columns
    # and add a space after each column
    result = ""
    for c = 1 : C-1
        for r = 1 : R;    result *= chars[r, c];    end
        result *= ' '
    end



    # Read out the last column
    for r = 1 : R;    result *= chars[r, C];    end


    result
end

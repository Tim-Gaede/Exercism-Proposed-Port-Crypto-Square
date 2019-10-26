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
    rows = convert(Int64, root_)
    rows*rows == length(text)    ?    cols = rows    :    cols = rows + 1
    if rows*cols < length(text);    rows += 1;    end



    # Define a rectangle and fill the rectangle with the chars
    chars = [' '    for r = 1:rows, c = 1:cols]
    for n = 0 : length(text)-1
        c = n % cols + 1
        r = n ÷ cols + 1
        chars[r, c] = text[n+1]
    end



    # Read out all but the last of the rectangle's columns
    # and add a space after each column
    result = ""
    for c = 1 : cols-1
        for r = 1 : rows;    result *= chars[r, c];    end
        result *= ' '
    end



    # Read out the last column
    for r = 1 : rows;    result *= chars[r, cols];    end


    return result
end

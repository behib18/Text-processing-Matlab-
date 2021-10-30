function[dicB] = MakeDic(dictv)
    sizeDic=length(dictv);
    numberOfBits=ceil(log2(sizeDic));
    dicB={};
    for i=0:sizeDic-1
        dicB=[dicB,decimalToBinaryVector(i,numberOfBits)];
    end
end

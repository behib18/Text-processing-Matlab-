clc;
clear all;
%function [finalresult,dicB]=test(inputString,dictv)
inputString='AABABBBABAABABBBABBA';
dictv={'A','B'};
    checkItem={};
    select2Item=[];
    changeItem={};
    result=[];
    finalResult=[];
    countSting=1;
    countItem=1;
    character=[];
    sizeItem=0;
    sizeInputString =length(inputString);
    disp(sizeInputString);
    check=0;
    
    
    
    while( countSting <= sizeInputString )
       
    	sizeItem =length(checkItem);
    	character=inputString(countSting);
        countItem=1;
    	while(countItem <= sizeItem)   		
    		if strcmp(character,checkItem(countItem))
    			character=[character,inputString(countSting+1)];
    			countSting=countSting+1;
				check=1;
			else
			    check=1;
        	end
        	countItem=countItem+1;
    	end
    	if check==1
    	    checkItem=[checkItem ,character];
    	    check=0;
    	end
    	if sizeItem == 0
    		checkItem=[checkItem ,character];
    	end
        countSting=countSting+1;
    end
    countItem=1;
    while(countItem <= length(checkItem))       
        selectItem=checkItem{countItem};            
        count=1;
        select2Item=[];
        if length(selectItem)==1
            check=1;
        end
        while(count<length(selectItem) | check)
            char=selectItem(count);
            select2Item=[select2Item char];
            check=0;
            count=count+1;
        end
         changeItem=[changeItem,select2Item];
    
        countItem=countItem+1;
    end
    display(changeItem);    
    combineItem=cell(1,length(changeItem));
    combineItem(1)=changeItem(1);
    display(combineItem);
    
    count=2;
    while (count<= length(changeItem))
        for i=1:length(checkItem)
            if (strcmp(changeItem(count),checkItem(i)) & length(checkItem{count})~=1)
                char=checkItem{count};
                combineItem(count)=cellstr(sprintf('%g%s',i,char(length(char))));
                display(char(length(char)));
                display(i);
            end
            if length(checkItem{count})==1
                combineItem(count)=cellstr(sprintf('%g%s',0,char(length(char))));
            end
        end
        %ta in ghesmat satre 2 va 3 jadval sakhte mishavad az inja be bad
        %satre sevvom ke dar word amade ast tabdil be binary mishavad
    count=count+1;
    end
    display(combineItem);
    [dicB]=MakeDic(dictv);
    display(dicB);
    for i=1:length(combineItem)
        result=[result ,combineItem{i}];
    end
    display(result);
    j=1;
    n=1;
    for i=1:length(result)
        if mod(i,2)==1
            char=result(i);
           index=find(strcmp(dictv,char));
           finalResult=[finalResult,dicB{index}];
        else
            num=str2num(result(i));
            finalResult=[finalResult,decimalToBinaryVector(num,j)]; 
            n=n-1;
            if n==0
                j=j+1;
                display("jkhjkhjjhkj");
                n=power(2,j-1);
            end
        end
         
    end
       display(finalResult);
 
%end  



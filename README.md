
First XML
===
 	<Data>
    	<id>0</id>
    	<name>omer</name>
	 </Data>
    Data, id, name = elementName;
    0, omer        = characters 


CUTXMLParser Create 
=====
        CUTXMLParser * cutXMLParser = [[CUTXMLParser alloc] init];
        [cutXMLParser setDelegate:self];
        [cutXMLParser startCutXMLParseWithURL:urlString];
      //OR   
      //[cutXMLParser startCutXMLParseWithURL:urlString elementNameToken:token];
      //[cutXMLParser startCutXMLParseWithURL:urlString elementNameTokenArray:tokenArray];
      
CUTXMLParser Delegate Methods
--
		
		//your xml,elements and characters 
		
 	(void)cutXMLParser :(NSXMLParser         *)parser
       finisDataDictionary :(NSMutableDictionary *)dataDictionary
          elementNameArray :(NSMutableArray      *)dataElementArray
       foundCharactersData :(NSMutableArray      *)dataCharactersArray;

    	(void)cutXMLParser :(NSXMLParser *)parser
	  elementNameToken :(NSString    *)elementNameToken
           foundCharacters :(NSString    *)dataCharacters;
		 
        (void)cutXMLParser :(NSXMLParser        *)parser     
         elementTokenArray :(NSArray            *)elementTokenArray
      foundCharactersArray :(NSMutableArray     *)dataCharactersArray;


  if u dont want to use delegate methods so create CUTXMLModel , its easy.

XMLParser Easy with CUTXMLModel 
--
    //Create CUTXMLModel 
    
    CUTXMLModel   * model0 = [[CUTXMLModel alloc] initWithXMLURLString:url];
    //OR
    //CUTXMLModel * model1 = [[CUTXMLModel alloc] initWithXMLURLString:url foundThisElementToken:token]];
    //CUTXMLModel * model2 = [[CUTXMLModel alloc] initWithXMLURLString:url foundThisElementTokenArray:data];
    
    after cutting xml and call to datas.
    CUTXMLModel class Datas
     NSMutableArray * dataElementNameArray;
     NSMutableArray * dataCharactersArray;
     NSMutableArray * dataElementNameTokenArray;
     NSDictionary   * attributeDictionary;
     NSString       * namespaceURIString;
     NSMutableArray * dataTokenCharactersArray;//if u are using model3, calling  CUTXMLParser delegate method elementTokenArray
     
     //Call data
     NSMutableArray * dataCharactersArray = [NSMutableArray arrayWithArray:model0.dataCharactersArray];
     
     

  Good Luck :)
    
    
    
    
    

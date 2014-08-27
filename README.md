CUTXMLParser
============
First XML

 <Data>
    <id>0</id>
    <name>omer</name>
 </Data>
//Data, id, name = ElementName;
//0, omer        = characters 


CUTXMLParser Create 
        CUTXMLParser * cutXMLParser = [[CUTXMLParser alloc] init];
        [cutXMLParser setDelegate:self];
        [cutXMLParser startCutXMLParseWithURL:urlString];
      //OR   
      //[cutXMLParser startCutXMLParseWithURL:urlString elementNameToken:token];
      //[cutXMLParser startCutXMLParseWithURL:urlString elementNameTokenArray:tokenArray];
      
CUTXMLParse Delegate Methods

- (void)cutXMLParser :(NSXMLParser         *)parser
 finisDataDictionary :(NSMutableDictionary *)dataDictionary
 
    elementNameArray :(NSMutableArray      *)dataElementArray
 foundCharactersData :(NSMutableArray      *)dataCharactersArray;

- (void)cutXMLParser :(NSXMLParser *)parser
    elementNameToken :(NSString    *)elementNameToken
     foundCharacters :(NSString    *)dataCharacters;
     
- (void)cutXMLParser :(NSXMLParser        *)parser
   elementTokenArray :(NSArray            *)elementTokenArray
foundCharactersArray :(NSMutableArray     *)dataCharactersArray;


if u dont wantto use delegate methods so create CUTXMLModel , its easy.

Easy CUTXMLModel Create

    CUTXMLModel * model0 = [[CUTXMLModel alloc] initWithXMLURLString:url];
    //OR
    //CUTXMLModel * model1 = [[CUTXMLModel alloc] initWithXMLURLString:url foundThisElementToken:token]];
    //CUTXMLModel * model2 = [[CUTXMLModel alloc] initWithXMLURLString:url foundThisElementTokenArray:data];
    
    after cutting xml and call to datas.
    Datas
     NSMutableArray * dataElementNameArray;
     NSMutableArray * dataCharactersArray;
     NSMutableArray * dataElementNameTokenArray;
     NSDictionary   * attributeDictionary;
     NSString       * namespaceURIString;
     NSMutableArray * dataTokenCharactersArray;

  Good Luck :)
    
    
    
    
    

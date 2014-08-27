//
//  CUTXMLParser.h
//  CUTXMLParser
//
//  Created by omer kantar on 26/08/14.
//  Copyright (c) 2014 mobilike. All rights reserved.
//

#import "CUTXMLModel.h"

@implementation CUTXMLModel


- (id)initWithXMLURLString :(NSString *)urlString
{
    if (self)
    {
        cutXMLParser = [[CUTXMLParser alloc] init];
        [cutXMLParser setDelegate:self];
        [cutXMLParser startCutXMLParseWithURL:urlString];

    }
    return self;
}

- (id)initWithXMLURLString:(NSString *)urlString foundThisElementToken:(NSString *)token
{
    if (self)
    {
        cutXMLParser = [[CUTXMLParser alloc] init];
        [cutXMLParser setDelegate:self];
        [cutXMLParser startCutXMLParseWithURL:urlString elementNameToken:token];
    }
    return self;
}

- (id)initWithXMLURLString:(NSString *)urlString foundThisElementTokenArray:(NSArray *)tokenArray
{
    if (self)
    {
        cutXMLParser = [[CUTXMLParser alloc] init];
        [cutXMLParser setDelegate:self];
        [cutXMLParser startCutXMLParseWithURL:urlString elementNameTokenArray:tokenArray];
    }
    return self;
}

# pragma mark - CUTXMLParser Delegate Methods
- (void)cutXMLParserDidStartDocument:(NSXMLParser *)parser
{
    self.dataCharactersArray  = [[NSMutableArray alloc] init];
    self.dataElementNameArray = [[NSMutableArray alloc] init];
    self.dataElementNameTokenArray       = [[NSMutableArray alloc] init];
    
}

- (void)cutXMLParser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI attributes:(NSDictionary *)attributeDict
{
    if (elementName == nil)
    {
        return;
    }
    elementNameString = elementName;
    
    [self.dataElementNameArray addObject:elementName];
    
}

- (void)cutXMLParser:(NSXMLParser *)parser foundCharacters:(NSString *)data
{
    [self.dataCharactersArray addObject:data];
}


- (void)cutXMLParser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
{
    if (elementNameToken != nil)
    {
        [self.dataElementNameArray addObject:elementName];
    }
}

- (void)cutXMLParser:(NSXMLParser *)parser finisDataDictionary:(NSMutableDictionary *)dataDictionary elementNameArray:(NSMutableArray *)dataElementArray foundCharactersData:(NSMutableArray *)dataCharactersArray
{
    
}

- (void)cutXMLParser:(NSXMLParser *)parser elementNameToken:(NSString *)elementNameToken foundCharacters:(NSString *)dataCharacters
{
    [self.dataElementNameTokenArray addObject:dataCharacters];
}

- (void)cutXMLParser:(NSXMLParser *)parser elementTokenArray:(NSArray *)elementTokenArray foundCharactersArray:(NSMutableArray *)dataCharactersArray
{
    self.dataTokenCharactersArray =dataCharactersArray;
}

@end

//
//  CUTXMLParse.m
//  CUTXMLParse
//
//  Created by omer kantar on 26/08/14.
//  Copyright (c) 2014 mobilike. All rights reserved.
//

#import "CUTXMLParser.h"

@implementation CUTXMLParser

- (void)setDelegate :(id)newDelegate
{
    delegate = newDelegate;
}

- (void)startCutXMLParseWithURL :(NSString *)url
{
    NSURL * URL = [[NSURL alloc] initWithString:url];

    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
    [parser setDelegate:self];
    [parser parse];
}

- (void)startCutXMLParseWithURL :(NSString *)url
               elementNameToken :(NSString *)elementName
{
    NSURL * URL = [[NSURL alloc] initWithString:url];
    elementNameToken = elementName;
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
    [parser setDelegate:self];
    [parser parse];

}
- (void)startCutXMLParseWithURL:(NSString *)url elementNameTokenArray:(NSArray *)elementNameArray
{
    elementNameTokenArray = [NSArray arrayWithArray:elementNameArray];
    charactersTokenArray  = [NSMutableArray array];
    NSURL * URL = [[NSURL alloc] initWithString:url];
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
    [parser setDelegate:self];
    [parser parse];

}

# pragma mark - NSXMLParse Delegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{

    [delegate cutXMLParserDidStartDocument:parser];

    dataDictionary            = [NSMutableDictionary dictionary];
    dataElementNameArray      = [NSMutableArray  array];
    dataCharactersArray       = [NSMutableArray  array];


}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{

    [delegate cutXMLParser:parser didStartElement:elementName namespaceURI:namespaceURI attributes:attributeDict];

    if (elementName != nil)
    {
        elementString = elementName;
        [dataElementNameArray addObject:elementName];
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // cut \n string character

    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" "  withString:@""];

    if (string == nil || [string  isEqual: @""])
    {
        return;

    }else
    {
        [delegate cutXMLParser:parser foundCharacters:string];

        [dataDictionary setObject:string forKey:elementString];

        [dataCharactersArray addObject:string];
        
        if ([elementString isEqualToString:elementNameToken])
        {
            [delegate cutXMLParser:parser elementNameToken:elementNameToken foundCharacters:string];
        }
        
        if (elementNameTokenArray != nil)
        {
            for (NSString * token in elementNameTokenArray)
            {
                if ([elementString isEqualToString:token])
                {
                    [charactersTokenArray addObject:string];
                }
            }
        }
    }

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [delegate cutXMLParser:parser didEndElement:elementName];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [delegate cutXMLParser:parser finisDataDictionary:dataDictionary elementNameArray:dataElementNameArray foundCharactersData:dataCharactersArray];
   
    if (elementNameTokenArray != nil)
    {
        [delegate cutXMLParser:parser elementTokenArray:elementNameTokenArray foundCharactersArray:charactersTokenArray];
    }
}





@end

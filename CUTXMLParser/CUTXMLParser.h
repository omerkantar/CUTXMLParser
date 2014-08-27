//
//  CUTXMLParser.h
//  CUTXMLParser
//
//  Created by omer kantar on 26/08/14.
//  Copyright (c) 2014 mobilike. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CUTXMLParserDelegate
@optional

- (void)cutXMLParserDidStartDocument :(NSXMLParser  *)parser;

- (void)cutXMLParser :(NSXMLParser *)parser
     didStartElement :(NSString    *)elementName
         namespaceURI:(NSString *)namespaceURI
           attributes:(NSDictionary *)attributeDict;

- (void)cutXMLParser :(NSXMLParser *)parser
     foundCharacters :(NSString    *)data;

- (void)cutXMLParser :(NSXMLParser *)parser
       didEndElement :(NSString    *)elementName;

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


@end


@interface CUTXMLParser : NSObject <NSXMLParserDelegate>

{
    id delegate;

    NSMutableDictionary   * dataDictionary;
    NSMutableArray        * dataElementNameArray;
    NSMutableArray        * dataCharactersArray;
    NSString              * elementString;
    NSString              * elementNameToken;
    NSArray               * elementNameTokenArray;
    NSMutableArray        * charactersTokenArray;



}



- (void)setDelegate             :(id)newDelegate;
- (void)startCutXMLParseWithURL :(NSString *)url;
- (void)startCutXMLParseWithURL :(NSString *)url
               elementNameToken :(NSString *)elementName;
- (void)startCutXMLParseWithURL :(NSString *)url
          elementNameTokenArray :(NSArray  *)elementNameArray;

@end

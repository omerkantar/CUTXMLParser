//
//  CUTXMLParser.h
//  CUTXMLParser
//
//  Created by omer kantar on 26/08/14.
//  Copyright (c) 2014 mobilike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUTXMLParser.h"

@interface CUTXMLModel : NSObject <CUTXMLParserDelegate>

{
    CUTXMLParser * cutXMLParser;
    NSString     * elementNameToken;
    NSString     * elementNameString;
    NSArray      * elementNameTokenArray;
}

@property (nonatomic, strong) NSMutableArray * dataElementNameArray;
@property (nonatomic, strong) NSMutableArray * dataCharactersArray;
@property (nonatomic, strong) NSMutableArray * dataElementNameTokenArray;
@property (nonatomic, strong) NSDictionary   * attributeDictionary;
@property (nonatomic, strong) NSString       * namespaceURIString;
@property (nonatomic, strong) NSMutableArray * dataTokenCharactersArray;


- (id)initWithXMLURLString :(NSString *)urlString;
- (id)initWithXMLURLString :(NSString *)urlString
     foundThisElementToken :(NSString *)token;
- (id)initWithXMLURLString :(NSString *)urlString
foundThisElementTokenArray :(NSArray  *)tokenArray;

@end

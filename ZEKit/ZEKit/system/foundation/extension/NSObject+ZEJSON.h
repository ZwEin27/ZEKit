//
//  NSObject+ZEJSON.h
//  ZEKit
//
//  Created by zwein on 6/6/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZEPrecompile.h"

#pragma mark -

@interface NSObject(ZEJSON)

+ (id)objectsFromArray:(id)arr;
+ (id)objectsFromAny:(id)any;

+ (id)objectFromDictionary:(id)dict;
+ (id)objectFromString:(id)str;
+ (id)objectFromData:(id)data;
+ (id)objectFromAny:(id)any;

- (id)objectToDictionary;
- (id)objectToString;
- (id)objectToData;
- (id)objectZerolize;

- (id)objectToDictionaryUntilRootClass:(Class)rootClass;
- (id)objectToStringUntilRootClass:(Class)rootClass;
- (id)objectToDataUntilRootClass:(Class)rootClass;
- (id)objectZerolizeUntilRootClass:(Class)rootClass;

- (id)serializeObject;
+ (id)unserializeObject:(id)obj;

@end

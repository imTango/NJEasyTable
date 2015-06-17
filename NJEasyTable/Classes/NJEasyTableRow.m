//
//  NJEasyTableRow.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "NJEasyTableRow.h"
#import "NSObject+NJEasyTable.h"

NSString *const NJEasyTableRowCellHeightAttributeKey = @"NJEasyTableRowCellHeight";
NSString *const NJEasyTableRowIdentifierAttributeKey = @"NJEasyTableRowIdentifier";

@implementation NJEasyTableRow

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
        [_model nj_registNodeObject:self];
    }
}

- (id)initWithModel:(id)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

- (instancetype)initWithModel:(id)model attributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        self.model = model;
        [self parseAttributes:attributes];
    }
    return self;
}

- (void)parseAttributes:(NSDictionary *)attributes {
    
    if (attributes) {
        NSNumber *cellHeight = attributes[NJEasyTableRowCellHeightAttributeKey];
        if ([cellHeight isKindOfClass:[NSNumber class]]) {
            self.cellHeight = cellHeight.floatValue;
        }
    }
}

- (NSIndexPath *)indexPath {
    
    NSUInteger section = [self.parent nodeIndex];
    NSUInteger row = [self nodeIndex];
    
    if (section != NSNotFound && row != NSNotFound) {
        
        return [NSIndexPath indexPathForRow:row inSection:section];
    } else {
        
        return nil;
    }
}

@end

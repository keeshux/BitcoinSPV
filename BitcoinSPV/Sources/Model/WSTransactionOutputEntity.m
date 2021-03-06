//
//  WSTransactionOutputEntity.m
//  BitcoinSPV
//
//  Created by Davide De Rosa on 16/07/14.
//  Copyright (c) 2014 Davide De Rosa. All rights reserved.
//
//  https://github.com/keeshux
//
//  This file is part of BitcoinSPV.
//
//  BitcoinSPV is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  BitcoinSPV is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with BitcoinSPV.  If not, see <http://www.gnu.org/licenses/>.
//

#import "WSTransactionOutputEntity.h"
#import "WSTransactionEntity.h"
#import "WSScript.h"
#import "WSCoreDataManager.h"

@implementation WSTransactionOutputEntity

@dynamic scriptData;
@dynamic value;
@dynamic transaction;

- (void)copyFromOutput:(WSTransactionOutput *)output
{
    self.scriptData = [[output.script toBuffer] data];
    self.value = @(output.value);
}

- (WSTransactionOutput *)toOutputWithParameters:(WSParameters *)parameters
{
    WSBuffer *scriptBuffer = [[WSBuffer alloc] initWithData:self.scriptData];
    WSScript *script = [[WSScript alloc] initWithParameters:nil buffer:scriptBuffer from:0 available:scriptBuffer.length error:NULL];
    const uint64_t value = (uint64_t)[self.value unsignedLongLongValue];

    return [[WSTransactionOutput alloc] initWithParameters:parameters script:script value:value];
}

@end

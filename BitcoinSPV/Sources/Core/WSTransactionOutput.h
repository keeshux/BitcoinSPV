//
//  WSTransactionOutput.h
//  BitcoinSPV
//
//  Created by Davide De Rosa on 26/07/14.
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

#import <Foundation/Foundation.h>

#import "WSBuffer.h"
#import "WSSized.h"

@class WSParameters;
@class WSScript;
@class WSAddress;

@interface WSTransactionOutput : NSObject <WSBufferEncoder, WSBufferDecoder, WSSized>

- (instancetype)initWithParameters:(WSParameters *)parameters script:(WSScript *)script value:(uint64_t)value;
- (instancetype)initWithAddress:(WSAddress *)address value:(uint64_t)value;
- (WSParameters *)parameters;
- (WSScript *)script;
- (WSAddress *)address;
- (uint64_t)value;

@end

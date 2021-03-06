//
//  WSBIP44.h
//  BitcoinSPV
//
//  Created by Davide De Rosa on 17/09/15.
//  Copyright (c) 2015 Davide De Rosa. All rights reserved.
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

#import "WSParameters.h"

typedef enum {
    WSBIP44CoinTypeMain,
    WSBIP44CoinTypeTestnet3
} WSBIP44CoinType;

@interface WSParameters (BIP44)

- (WSBIP44CoinType)coinType;
- (NSString *)bip44PathForAccount:(uint32_t)account;

@end

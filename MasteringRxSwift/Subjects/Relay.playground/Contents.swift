//
//  Mastering RxSwift
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift
import RxCocoa

/*:
 # Relay
 */
/*
 릴레이는 세가지가 있고 publish, behavior, replay
 서브젝트와 유사하고 내부에 서브젝트를 래핑하고있다.
 서브젝트와 유사 그러나 next이벤트만 전달하는 차이가 있다
 서브젝트와그래서 종료되지 않는다.
 구독자가 dispose되기 전까지 계속 일함
 ui event를 전달할때 씀
 */

let bag = DisposeBag()

let prelay = PublishRelay<Int>()

prelay
    .subscribe{print("1",$0)}
    .disposed(by: bag)

// onnext가 릴레이에서는 accept이다
prelay.accept(1)

let brelay = BehaviorRelay(value: 3)

brelay
    .subscribe{print("2",$0)}
    .disposed(by: bag)

brelay.accept(3)

// brelay가 가지고 있는 기능. 최근의 이벤트를 저장하고 보여줌
brelay.value




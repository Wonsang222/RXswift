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

/*:
 # BehaviorSubject
 */
/*
 생성시점에 시작이벤트를 지정하고(즉 시작하자마자 내부에 next이벤트 하나 주고 시작)
 가장 마지막에 들어오는 최신 이벤트를 저장하고 구독자에게 전달
 
 퍼블리쉬는 값없이 시작, 이거는 값 있게 시작
 
 컴플리티드 이벤트가 중요하다
 
 */
let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}


let a = BehaviorSubject<Int>(value: 1)
a.subscribe{print("1", $0)}
    .disposed(by: disposeBag)

a.onNext(2)

a.subscribe{print("3", $0)}
    .disposed(by: disposeBag)

a.onCompleted()
// 컴플리트 에러가 발생하는 즉시, 해당 behaviorsubject는 가지고 잇는 next를 실행하지 않고 completed를 실행함

a.subscribe{print("4", $0)}
    .disposed(by: disposeBag)








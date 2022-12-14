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
 # AsyncSubject
 */
/*
 서브젝트로 completed이벤트 전달 시점에  마지막으로 전달된 next 이벤트 구독자에게 전달
 
 completed 이벤트가 전달될까지 어떤 이벤트도 전달하지 않는다.
 
 에러의 경우엔  next 이벤트가 전달되지 않고
 에러이벤트만 전달하고 종료댐
 
 */
let bag = DisposeBag()

enum MyError: Error {
   case error
}

let test = AsyncSubject<Int>()

test
    .subscribe{print($0)}
    .disposed(by: bag)

test.onNext(1)
test.onNext(2)
test.onNext(3)
test.onNext(4)

test.onCompleted()




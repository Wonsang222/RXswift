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
 # ReplaySubject
 */
/*
 두개 이상의 이벤트를 새로운 구독자에게 전달하고 싶다면 이걸 사용
 하나이상의 최신 이벤트를 버퍼에 전달하고 구독자가 생기면 와르르 전달
 
 on complete, error 둘다 기존의 버퍼 크기만큼의 이벤트를 전달하고 실행함.
 앞의 두개와는 다른측면이 잇음
 
 버퍼의 크기만큼 저장한다. 메모리에 저장되기때무네 너무 큰 버퍼를 사용하는 것은 안된다.
 
 */
let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

let rs = ReplaySubject<Int>.create(bufferSize: 3)

(1...10).forEach{rs.onNext($0)}

rs.subscribe {
    print("ob1",$0)
}.disposed(by: disposeBag)


rs.onNext(11)



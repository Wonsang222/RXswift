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
 # PublishSubject
 */
/*
 가장 기본적인 subject
 subject oberservable 이자 observer
 들어오는 이벤트를 구독자로 전달
 
 
 */


let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}



let a = PublishSubject<String>()
a.onNext("Hello")


// 퍼블리쉬는 구독 이후에 즉 지금 시점 이후에 전달되는 이벤트만 전달한다 위의 헬로우는 전달되지 못한다.
let b = a.subscribe{print(">>1", $0)}
b.disposed(by: disposeBag)


a.onNext("RXSWIFT")


let c = a.subscribe{print(">>2", $0)}
c.disposed(by: disposeBag)

a.onNext("wonsang")


// 컴플리티드는 onnext와는 다르게 모든 구독자에게 즉시 알림이 간다, 에러 역시 마찬가지
a.onCompleted()

let d = a.subscribe{print(">>3", $0)}
d.disposed(by: disposeBag)

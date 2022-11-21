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
 # Disposables
 */
//disposable 리소스 정리에 필요함 그러나 observable이 전달하지 않음

/*
 1번 예시에서는 옵저버블이 다 끝나고 실행이됨
 2번예시에서는 컴플리티드까지 실행이 된다.
 디스포즈드는 실행이 안된다 즉 리소스 정리를 따로 해줘야함
 
 
 */

// 리소스 해제방법 2
var bag = DisposeBag()

let a = Observable.from([0,1,2])
    .subscribe { elem in
        print("Next", elem)
    } onError: { error in
        print("Error", error)
    } onCompleted: {
        print("done")
    } onDisposed: {
        print("dispoased")
    }
        

// 리소스 해제방법 1
//a.dispose()


              Observable.from([0,1,2])
            .subscribe {
                print($0)
            }
            .disposed(by: bag)

bag = DisposeBag()
//bag = nil
//내가 원하는 시점에 해제시키고 싶을때..


let cc = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: { elem in
        print("Next", elem)
    }, onError: { error in
        print("Error", error)
    }, onCompleted: {
        print("done")
    }, onDisposed: {
        print("dispoased")
    }
    )

DispatchQueue.main.asyncAfter(deadline: .now() + 3){
    cc.dispose()
}


//completed 가 실행이 안댐 dispose로 강제 해제하면,,, take until 을 써야한다.

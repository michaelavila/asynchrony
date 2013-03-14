package com.sciprog.asynchrony {

    public function callable(method:Function, ... _args):CallableMethod {
        return new CallableMethod(method, _args);
    }
}

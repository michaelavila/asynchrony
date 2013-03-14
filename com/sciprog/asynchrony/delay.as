package com.sciprog.asynchrony {

    public function delay(time:uint):Asynchronous {
        var token:AsyncMethodToken = new AsyncMethodToken();
        token.waitFor(time);
        return token;
    }
}

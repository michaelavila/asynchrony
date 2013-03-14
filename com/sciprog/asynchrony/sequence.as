package com.sciprog.asynchrony {

    public function sequence(... _args):MethodSequence {
        return new MethodSequence(_args).execute();
    }
}

package com.sciprog.asynchrony {

    public function group(... _args):MethodGroup {
        return new MethodGroup(_args).execute();
    }
}

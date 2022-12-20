function fn() {
	var env = karate.env; //get system property 'karate.env' karate.log('karate.env system)
	if (!env) {
		env = 'dev';
	}
	var config = {
		env: env,
		myVarName: 'hello karate',
		baseUrl: 'https://gorest.co.in',
		tokenID: '88e8fbe52c57985ccf546879d18dc9b7b506c92a07e4fdefb42d3885d20e3e2f'
	}
	if (env == 'dev') {
		//customize
		//e.g. config.foo ='bar';
	} else if (env == 'e2e') {
		//customize
	}
	return config;
}

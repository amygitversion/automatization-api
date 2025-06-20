function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	baseUrl: 'https://petstore.swagger.io/v2/user',
	//Trae la variable de entorno llamada TOKEN configurada en intellij y la guarda en la variable token para los tests
	token: java.lang.System.getenv('TOKEN'),
	clientId: java.lang.System.getenv('CLIENT_ID'),
	clientSecret: java.lang.System.getenv('CLIENT_SECRET'),
	xApiKey: java.lang.System.getenv('X_API_KEY'),
	baseUrl1005: 'http://tna-msa-dm-orqtransferencias1005.apps.ocptest.uiotest.bpichinchatest.test/api/v1/TransferenciasDirectas/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
